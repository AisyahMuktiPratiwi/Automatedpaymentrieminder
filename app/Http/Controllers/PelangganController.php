<?php

namespace App\Http\Controllers;

use App\Models\Fasilitas;
use App\Models\Pembayaran;
use App\Models\JumlahPintu;
use App\Models\Pelanggan;
use Illuminate\Http\Request;

class PelangganController extends Controller
{
    public function index()
    {
        $jumlahPintu = JumlahPintu::latest()->first();
        $penuh = $jumlahPintu && $jumlahPintu->jumlah_pintu <= 0;
        $fasilitas = Fasilitas::all();

        return view('welcome', compact('penuh','fasilitas'));
    }

    public function store(Request $request)
    {
        // Validasi inputan dari user
        $request->validate([
            'nama' => 'required|string|max:100',
            'nohp' => 'required|string|max:15',
            'password' => 'required|string|min:8',
            'tanggal_mulai_sewa' => 'required|date', // Validasi untuk tanggal mulai sewa
            'bukti_bayar' => 'required|file|mimes:jpg,png,pdf|max:2048',
        ]);

        // Memeriksa apakah jumlah pintu masih tersedia
        $jumlahPintu = JumlahPintu::latest()->first();
        if (!$jumlahPintu || $jumlahPintu->jumlah_pintu <= 0) {
            // Jika pintu sudah penuh (jumlah_pintu <= 0), maka tampilkan pesan error
            return redirect()->back()->withErrors(['error' => 'Jumlah pintu sudah penuh, pendaftaran tidak dapat dilakukan.']);
        }

        // Membuat pelanggan baru
        $pelanggan = Pelanggan::create([
            'nama' => $request->nama,
            'nohp' => $request->nohp,
            'password' => bcrypt($request->password),
            'status' => 'aktif', // langsung aktif
            'tanggal_mulai_sewa' => $request->tanggal_mulai_sewa, // Menyimpan tanggal mulai sewa yang diinputkan
        ]);

        // Menyimpan bukti bayar
        $buktiBayar = $request->file('bukti_bayar')->store('bukti_bayar', 'public');

        // Menyimpan pembayaran dengan format bulan Y-m
        Pembayaran::create([
            'pelanggan_id' => $pelanggan->id,
            'tanggal_mulai_sewa' => $request->tanggal_mulai_sewa, // Menyimpan tanggal mulai sewa
            'bulan' => now()->format('Y-m'), // Format Y-m untuk bulan
            'status_pembayaran' => 'belum bayar',
            'tanggal_pembayaran' => now(),
            'bukti_bayar' => $buktiBayar,
            'konfirmasi' => 'menunggu konfirmasi',
        ]);

        // Mengurangi jumlah pintu karena pelanggan langsung aktif
        if ($jumlahPintu && $jumlahPintu->jumlah_pintu > 0) {
            $jumlahPintu->jumlah_pintu -= 1;
            $jumlahPintu->save();
        }

        // Redirect dengan sukses
        return redirect()->route('depan.index')->with('success', 'Pendaftaran pelanggan berhasil.');

    }





}
