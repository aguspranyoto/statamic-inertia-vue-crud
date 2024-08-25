<?php

use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', [UserController::class, 'index'])->name('home');
Route::get('/create', [UserController::class, 'create'])->name('users.create');
Route::post('/store', [UserController::class, 'store'])->name('users.store');
Route::get('/edit/{id}', [UserController::class, 'edit'])->name('users.edit');
Route::put('/update/{id}', [UserController::class, 'update'])->name('users.update');
Route::delete('/delete/{id}', [UserController::class, 'delete'])->name('users.delete');