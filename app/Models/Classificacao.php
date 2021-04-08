<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class Classificacao extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'classificacao';
    protected $primaryKey = 'id';

    // Retorna a classificação
    public function getClassificacao() {
        $dbDados = DB::select(' SELECT *FROM classificacaoBrasileirao ');
        return $dbDados;
    } // FIM getClassificacao

    // Insere ou atualiza os dados da equipe na tabela de classificacao
    public function atualizaClassificacao($idTime,$pontos) {

        $data = DB::select('select * from classificacao where id_time = :id',[
            'id' => $idTime
        ]);

        if(count($data) > 0) {

            DB::update('update classificacao set pontos = :pontos where id_time = :id ',[
                'id' => $idTime,
                'pontos' => $pontos + $data[0]->pontos
            ]);
        }
        else {
            DB::insert('insert into classificacao (id_time,pontos) values (:id,:pontos)', [
                'id' => $idTime,
                'pontos' => $pontos
            ]);
        }

    } // FIM atualizaClassificacao

} // FIM Model Classificacao
