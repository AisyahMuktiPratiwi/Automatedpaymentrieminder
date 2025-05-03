<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Pelanggan extends Authenticatable

{

        protected $fillable = ['nama', 'nohp', 'password','tanggal_mulai_sewa', 'status'];

        public function pembayaran()
        {
            return $this->hasMany(Pembayaran::class);
        }


}
