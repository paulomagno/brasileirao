<?php

// Retorna um identificador de texto de acordo com a classificação do clube
if (!function_exists('classificacaoBrasileirao')) {

    function classificacaoBrasileirao($posicao) {
        $situacao = '';

        switch ($posicao) {
            case 1:
                $situacao = 'campeao';
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
                $situacao = 'libertadores';
                break;
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
                $situacao = 'sul-americana';
                break;
            case 17:
            case 18:
            case 19:
            case 20:
                $situacao = 'rebaixado';
                break;
            default:
                $situacao = '';
                break;
        }

        return $situacao;
    } // FIM classificacaoBrasileirao

} // FIM function_exists(classificacaoBrasileirao)
