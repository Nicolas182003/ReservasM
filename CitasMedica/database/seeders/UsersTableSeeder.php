<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Nicolas',
            'email' => 'nikolira2003@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('nikolira404'),
            'cedula' =>'21434405-k',
            'address' => 'Pasaje Int. Lo boza',
            'phone' => '950319731',
            'role' => 'admin',
        ]);

        User::create([
            'name' => 'NicolasPaciente',
            'email' => 'paciente1@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('nikolira404'),
            'role' => 'paciente',
        ]);

        User::create([
            'name' => 'NicolasDoctor',
            'email' => 'medico1@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('nikolira404'),
            'role' => 'doctor',
        ]);
        User::factory()
            ->count(50)
            ->create();
    }
}
