<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Confronto extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'confrontos';
    protected $primaryKey = 'id';
}
