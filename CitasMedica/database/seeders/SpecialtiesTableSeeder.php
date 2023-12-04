<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Specialty;


class SpecialtiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $specialties = [
            'Neurologia',
            'Peiatria',
            'Psiquiatra',
            'Dermatologo',
            'Kinesiologo',
            'Cardiologia',
            'Dermatologia'
        ];
        foreach ($specialties as $specialty){
            Specialty::create([
                'name'=> $specialty
            ]);
        }
    }
}
