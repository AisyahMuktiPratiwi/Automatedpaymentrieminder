<?php

namespace App\Http\Controllers;

use App\Models\Pembayaran;
use Illuminate\Support\Facades\Auth;



use Illuminate\Http\Request;

class PembayaranController extends Controller
{
    //
    public function dashboard()
{
 $user = Auth::guard('pelanggan')->user();

    // Ambil semua histori untuk filter bulan
    $allHistori = Pembayaran::where('pelanggan_id', $user->id)->get();

    // Untuk tampilan table, kita pakai yang paginate
    $histori = Pembayaran::where('pelanggan_id', $user->id)->orderBy('bulan', 'desc')->paginate(5);

    // Buat array semua bulan dari mulai sewa hingga sekarang
    $bulanMulai = \Carbon\Carbon::parse($user->tanggal_mulai_sewa);
    $bulanSekarang = \Carbon\Carbon::now();
    $semuaBulan = [];

    while ($bulanMulai <= $bulanSekarang) {
        $format = $bulanMulai->format('Y-m');
        if (!$allHistori->contains('bulan', $format)) {
            $semuaBulan[] = $format;
        }
        $bulanMulai->addMonth();
    }

    return view('dashboard', compact('histori', 'semuaBulan'));
}
public function uploadBukti(Request $request)
{
    $request->validate([
        'bulan' => 'required|date_format:Y-m',
        'bukti_bayar' => 'required|image|max:2048',
    ]);

    $user = Auth::guard('pelanggan')->user();
    $path = $request->file('bukti_bayar')->store('bukti', 'public');

    Pembayaran::create([
        'pelanggan_id' => $user->id,
        'bulan' => $request->bulan,
        'bukti_bayar' => $path,
        'status_pembayaran' => 'belum bayar',
        'konfirmasi' => 'menunggu konfirmasi',
        'tanggal_pembayaran' => now(),
    ]);

    return redirect()->back()->with('success', 'Bukti berhasil diupload, pemilik komtrakan akan segera mengkonfirmasi pembayaran anda');
}


}
