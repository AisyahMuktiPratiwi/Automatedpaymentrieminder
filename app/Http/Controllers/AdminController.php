<?php
namespace App\Http\Controllers;

use App\Models\Fasilitas;
use App\Models\JumlahPintu;
use Illuminate\Http\Request;
use App\Models\Pelanggan;
use App\Models\Pembayaran;

use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    // Halaman utama admin
    public function index()
    {
        $jumlahFasilitas = Fasilitas::count();
         $jumlahPelanggan = Pelanggan::count();
         $jumlahpintu =JumlahPintu::all();
         return view('admin.dashboard', compact('jumlahFasilitas', 'jumlahPelanggan', 'jumlahpintu'));
    }


    public function konfirmasiPembayaran($id)
    {
        $pembayaran = Pembayaran::find($id);

        if ($pembayaran && $pembayaran->konfirmasi === 'menunggu konfirmasi') {
            $pembayaran->konfirmasi = 'sudah di konfirmasi';
            $pembayaran->status_pembayaran = 'sudah bayar';
            $pembayaran->save();

            $pelanggan = Pelanggan::find($pembayaran->pelanggan_id);
            if ($pelanggan && $pelanggan->status !== 'aktif') {
                $pelanggan->status = 'aktif';
                $pelanggan->save();

                $jumlahPintu = JumlahPintu::latest()->first();
                if ($jumlahPintu && $jumlahPintu->jumlah_pintu > 0) {
                    $jumlahPintu->jumlah_pintu -= 1;
                    $jumlahPintu->save();
                }
            }


    return back()->with('message', 'Konfirmasi pembayaran berhasil diperbarui.');
        }


    }

    public function showPembayaran(Request $request)
    {
        // Use paginate for proper pagination
        $pembayaransQuery = Pembayaran::with('pelanggan')->orderBy('tanggal_pembayaran', 'desc');

        // Filter berdasarkan pelanggan_id
        if ($request->filled('pelanggan_id')) {
            $pembayaransQuery->where('pelanggan_id', $request->pelanggan_id);
        }

        // Filter berdasarkan bulan
        if ($request->filled('bulan')) {
            $pembayaransQuery->where('bulan', $request->bulan);
        }

        // Apply pagination
        $pembayarans = $pembayaransQuery->paginate(6);

        // Ambil daftar pelanggan untuk dropdown
        $pelangganList = Pelanggan::all();

        // Inisialisasi array untuk bulan yang belum dibayar
        $semuaBulan = [];

        // Looping setiap pelanggan untuk menentukan bulan belum dibayar
        foreach ($pelangganList as $pelanggan) {
            $bulanMulai = \Carbon\Carbon::parse($pelanggan->tanggal_mulai_sewa);
            $bulanSekarang = \Carbon\Carbon::now();
            $belumDibayar = [];

            while ($bulanMulai <= $bulanSekarang) {
                $format = $bulanMulai->format('Y-m');

                $pembayaran = $pembayarans->first(function ($item) use ($pelanggan, $format) {
                    return $item->pelanggan_id == $pelanggan->id && $item->bulan == $format;
                });

                if (!$pembayaran) {
                    $belumDibayar[] = $format;
                }

                $bulanMulai->addMonth();
            }

            $semuaBulan[$pelanggan->id] = $belumDibayar;
        }

        return view('admin.konfirmasi', compact('pembayarans', 'pelangganList', 'semuaBulan'));
    }


    public function updateStatus(Request $request, $id)
{
    $request->validate([
        'status' => 'required|in:aktif,nonaktif'
    ]);

    $pelanggan = Pelanggan::findOrFail($id);
    $statusLama = $pelanggan->status;
    $statusBaru = $request->status;

    if ($statusLama !== $statusBaru) {
        $pelanggan->status = $statusBaru;
        $pelanggan->save();

        $jumlahPintu = JumlahPintu::latest()->first();
        if ($jumlahPintu) {
            if ($statusBaru === 'nonaktif') {
                $jumlahPintu->jumlah_pintu += 1;
            } elseif ($statusBaru === 'aktif' && $jumlahPintu->jumlah_pintu > 0) {
                $jumlahPintu->jumlah_pintu -= 1;
            }
            $jumlahPintu->save();
        }
    }

    return back()->with('message', 'Status pelanggan berhasil diperbarui.');
}

public function showStatusForm()
{
    $pelanggans = Pelanggan::all();
    $pelanggans = Pelanggan::paginate(6);
    return view('admin.status', compact('pelanggans')); // ganti view jika perlu
}

}
