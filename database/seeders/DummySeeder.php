<?php

namespace Database\Seeders;

use App\Models\Pelanggan;
use App\Models\Pembayaran;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class DummySeeder extends Seeder
{
    public function run(): void
    {
        $today = Carbon::today();

        // Pelanggan 1: 1 bulan sebelum hari ini
        $tanggalSewa1 = $today->copy()->subMonth();
        $pelanggan1 = Pelanggan::create([
            'nama' => 'tiwi',
            'nohp' => '6281319894484',
            'password' => Hash::make('password'),
            'tanggal_mulai_sewa' => $tanggalSewa1->toDateString(),
            'status' => 'aktif',
        ]);
        Pembayaran::create([
            'pelanggan_id' => $pelanggan1->id,
            'bulan' => $tanggalSewa1->format('F Y'),
            'konfirmasi' => 'sudah di konfirmasi',
            'status_pembayaran' => 'sudah bayar',
            'tanggal_pembayaran' => $tanggalSewa1->toDateString(),
            'bukti_bayar' => null,
        ]);

        // Pelanggan 2: 28 hari sebelum hari ini
        $tanggalSewa2 = $today->copy()->subDays(28);
        $pelanggan2 = Pelanggan::create([
            'nama' => 'Mia',
            'nohp' => '6289518850475',
            'password' => Hash::make('password'),
            'tanggal_mulai_sewa' => $tanggalSewa2->toDateString(),
            'status' => 'aktif',
        ]);
        Pembayaran::create([
            'pelanggan_id' => $pelanggan2->id,
            'bulan' => $tanggalSewa2->format('F Y'),
            'konfirmasi' => 'sudah di konfirmasi',
            'status_pembayaran' => 'sudah bayar',
            'tanggal_pembayaran' => $tanggalSewa2->toDateString(),
            'bukti_bayar' => null,
        ]);

        // Pelanggan 3: 35 hari sebelum hari ini
        $tanggalSewa3 = $today->copy()->subDays(35);
        $pelanggan3 = Pelanggan::create([
            'nama' => 'mflh',
            'nohp' => '6281382206488',
            'password' => Hash::make('password'),
            'tanggal_mulai_sewa' => $tanggalSewa3->toDateString(),
            'status' => 'aktif',
        ]);
        Pembayaran::create([
            'pelanggan_id' => $pelanggan3->id,
            'bulan' => $tanggalSewa3->format('F Y'),
            'konfirmasi' => 'sudah di konfirmasi',
            'status_pembayaran' => 'sudah bayar',
            'tanggal_pembayaran' => $tanggalSewa3->toDateString(),
            'bukti_bayar' => null,
        ]);
    }
}
