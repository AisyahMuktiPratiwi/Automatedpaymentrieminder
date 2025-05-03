<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Fasilitas;

class FasilitasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $fasilitas = [
            [
                'nama_fasilitas' => 'Kamar Depan',
                'deskripsi' => 'Kamar cukup luas yang nyaman untuk tidur dan menyimpan perlengkapan pakaian serta barang pribadi Anda dengan rapi.'
            ],
            [
                'nama_fasilitas' => 'Dapur & Wastafel',
                'deskripsi' => 'Area dapur bersih dengan wastafel, cocok untuk memasak makanan harian Anda dengan nyaman.'
            ],
            [
                'nama_fasilitas' => 'Kamar Mandi',
                'deskripsi' => 'Kamar mandi bersih dan terawat lengkap dengan kloset jongkok dan ember mandi yang higienis.'
            ],
            [
                'nama_fasilitas' => 'CCTV Keamanan',
                'deskripsi' => 'Sistem pengawasan 24 jam dengan CCTV untuk menjamin keamanan dan kenyamanan Anda setiap saat.'
            ]
        ];

        foreach ($fasilitas as $item) {
            Fasilitas::create($item);
        }
    }
}
