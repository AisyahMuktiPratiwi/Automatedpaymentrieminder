<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JumlahPintu extends Model
{
    //
     // Tentukan nama tabel jika tidak mengikuti konvensi penamaan tabel
     protected $table = 'jumlah_pintu';

     // Tentukan kolom yang boleh diisi
     protected $fillable = ['jumlah_pintu'];
}
