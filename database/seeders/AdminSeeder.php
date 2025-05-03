<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('admins')->insert([
            [
                'name' => 'Admin 1',
                'nohp' => '6281319894484', // Ganti dengan nomor admin
                'password' => Hash::make('password123'), // Ganti dengan password admin yang sesuai
            ],
            [
                'name' => 'Admin 2',
                'nohp' => '6281382206488', // Ganti dengan nomor admin
                'password' => Hash::make('password456'), // Ganti dengan password admin yang sesuai
            ]
        ]);
    }
}
