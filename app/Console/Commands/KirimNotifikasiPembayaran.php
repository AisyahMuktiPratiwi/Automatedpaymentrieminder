<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use App\Models\Pelanggan;
use App\Models\Pembayaran;
use App\Models\Admin;
use Carbon\Carbon;

class KirimNotifikasiPembayaran extends Command
{
    protected $signature = 'notifikasi:cek-pembayaran';
    protected $description = 'Kirim notifikasi WA untuk setiap bulan yang belum dibayar dari awal sewa hingga bulan ini';

    public function handle()
    {
        $today = Carbon::today();
        $pelanggans = Pelanggan::where('status', 'aktif')->get();

        foreach ($pelanggans as $pelanggan) {
            $tanggalMulaiSewa = Carbon::parse($pelanggan->tanggal_mulai_sewa);
            $tanggalCek = $tanggalMulaiSewa->copy();

            // Akhir bulan yang perlu dicek = bulan ini
            $tanggalAkhir = Carbon::create($today->year, $today->month, $tanggalMulaiSewa->day);

            while ($tanggalCek <= $tanggalAkhir) {
                $bulanFormat = $tanggalCek->format('Y-m'); // Contoh: 2025-02

                $sudahBayar = Pembayaran::where('pelanggan_id', $pelanggan->id)
                    ->where('bulan', $bulanFormat)
                    ->exists();

                if (!$sudahBayar) {
                    $dueDate = $tanggalCek->copy();
                   if($selisihHari2 = $dueDate->diffInDays($today, false)){
                    $selisihHari2 = -2;
                   }



                   $selisihHari = $today->diffInDays($dueDate, false);

                    if ($today->format('Y-m-d') === $dueDate->format('Y-m-d')) {
                        $selisihHari = 0;
                    }// false agar bisa negatif

                    if ($selisihHari2 === -2) {
                            $jumlahHariTerlambat = $dueDate->diffInDays($today);

                        $pesan = "🔔 Halo {$pelanggan->nama}, peringatan jatuh tempo ({$dueDate->translatedFormat('d F Y')}) untuk pembayaran kontrakan bulan {$tanggalCek->translatedFormat('F Y')}. Hari ini adalah *hari ke {$jumlahHariTerlambat}* dari waktu jatuh tempo anda. Jangan lupa untuk dibayarkan yaaa, dan kirimkan bukti pembayaran melalui web Kontrami

_pengingat ini akan dikirim h-2, Hari H, dan H+ jatuh tempo - dibayarkan_

*Ini adalah pesan otomatis, mohon tidak dibalas.*";
                        $this->kirimFonnte($pelanggan->nohp, $pesan);
                    } elseif ($selisihHari === 0) {
                        $pesan = "⚠️ Halo {$pelanggan->nama}, hari ini adalah jatuh tempo pembayaran kontrakan bulan {$tanggalCek->translatedFormat('F Y')} (tanggal {$dueDate->translatedFormat('d F Y')}). Segera bayarkan dan kirimkan bukti pembayaran via web Kontrami.
*Ini adalah pesan otomatis, mohon tidak dibalas.*";
                        $this->kirimFonnte($pelanggan->nohp, $pesan);
                    } elseif ($selisihHari < 0) {
                        $pesan = "❌ Halo {$pelanggan->nama}, sepertinya kamu masih belum membayar kontrakan bulan {$tanggalCek->translatedFormat('F Y')} (jatuh tempo {$dueDate->translatedFormat('d F Y')}). Ayo, jangan sampai tertunda terus! Mohon segera bayarkan dan kirimkan bukti pembayaran melalui web Kontrami. *Ini adalah pesan otomatis, mohon tidak dibalas.*";
                        $this->kirimFonnte($pelanggan->nohp, $pesan);
                    }
                }

                $tanggalCek->addMonth();
            }
        }

        // Kirim notifikasi ke admin jika ada pembayaran yang menunggu konfirmasi
        $pembayaranMenungguKonfirmasi = Pembayaran::where('konfirmasi', 'menunggu konfirmasi')->get();

        foreach ($pembayaranMenungguKonfirmasi as $pembayaran) {
            if ($pembayaran->pelanggan) {
                $adminPesan = "⚠️ Ada pembayaran kontrakan yang masih menunggu konfirmasi untuk pelanggan: {$pembayaran->pelanggan->nama}, bulan: {$pembayaran->bulan}. Mohon untuk segera konfirmasi pembayaran.";

                $admins = Admin::all();

                foreach ($admins as $admin) {
                    $this->kirimFonnte($admin->nohp, $adminPesan);
                }
            }
        }

        $this->info("✅ Semua notifikasi selesai dikirim.");
    }

    private function kirimFonnte($nomor, $pesan)
    {
        $response = Http::withHeaders([
            'Authorization' => env('FONNTE_TOKEN')
        ])->asForm()->post('https://api.fonnte.com/send', [
            'target' => $nomor,
            'message' => $pesan,
            'delay' => '1-3'
        ]);

        if ($response->successful()) {
            $this->info("✅ Pesan berhasil dikirim ke $nomor");
        } else {
            $this->error("❌ Gagal kirim ke $nomor: " . $response->body());
        }
    }
}
