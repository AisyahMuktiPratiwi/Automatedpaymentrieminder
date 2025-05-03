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

        // Pelanggan 1: Sewa dimulai bulan lalu
        $tanggalSewaPelanggan1 = $today->copy()->subMonth()->setDay($today->day);
        $pelanggan1 = Pelanggan::create([
            'nama' => 'Aisyah',
            'nohp' => '6281319894484',
            'password' => Hash::make('password'),
            'tanggal_mulai_sewa' => $tanggalSewaPelanggan1->toDateString(),
            'status' => 'aktif',
        ]);

        Pembayaran::create([
            'pelanggan_id' => $pelanggan1->id,
            'bulan' => Carbon::parse($pelanggan1->tanggal_mulai_sewa)->format('F Y'),
            'konfirmasi' => 'sudah di konfirmasi',
            'status_pembayaran' => 'sudah bayar',
            'tanggal_pembayaran' => null,
            'bukti_bayar' => null,
        ]);

        // Pelanggan 2: Sewa dimulai awal bulan lalu
        $tanggalSewaPelanggan2 = $today->copy()->subMonth()->startOfMonth();
        $pelanggan2 = Pelanggan::create([
            'nama' => 'Mia',
            'nohp' => '6289518850475',
            'password' => Hash::make('password'),
            'tanggal_mulai_sewa' => $tanggalSewaPelanggan2->toDateString(),
            'status' => 'aktif',
        ]);

        Pembayaran::create([
            'pelanggan_id' => $pelanggan2->id,
            'bulan' => Carbon::parse($pelanggan2->tanggal_mulai_sewa)->format('F Y'),
            'konfirmasi' => 'sudah di konfirmasi',
            'status_pembayaran' => 'sudah bayar',
            'tanggal_pembayaran' => null,
            'bukti_bayar' => null,
        ]);
    }
}
