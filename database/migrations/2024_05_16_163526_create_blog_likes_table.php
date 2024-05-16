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
        Schema::create('blog_likes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('blog_id')->references('id')->on('blogs')->onDelete('cascade');
            $table->foreignId('user_id')->references('id')->on('users')->onDelete('cascade')->nullable();
            $table->foreignId('vendor_id')->references('id')->on('vendors')->onDelete('cascade')->nullable();
            $table->foreignId('admin_id')->references('id')->on('admins')->onDelete('cascade')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('blog_likes');
    }
};
