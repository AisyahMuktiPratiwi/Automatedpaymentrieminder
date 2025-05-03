<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pembayarans', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('pelanggan_id');
            $table->foreign('pelanggan_id')->references('id')->on('pelanggans')->onDelete('cascade');


            $table->string('bulan', 20);
            $table->enum('konfirmasi', ['sudah di konfirmasi', 'menunggu konfirmasi'])->default('menunggu konfirmasi');
            $table->enum('status_pembayaran', ['sudah bayar', 'belum bayar'])->default('belum bayar');
            $table->date('tanggal_pembayaran')->nullable();
            $table->string('bukti_bayar')->nullable();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pembayarans');
    }
};
