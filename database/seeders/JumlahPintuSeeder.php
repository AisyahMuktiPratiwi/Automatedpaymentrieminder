<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class JumlahPintuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('jumlah_pintu')->insert([

            ['jumlah_pintu' => 15],
            ['jumlah_pintu' => 10],


        ]);
    }
}
