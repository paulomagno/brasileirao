<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

use App\Models\Classificacao;
use App\Models\Equipe;
use App\Models\Confronto;

class ClassificacaoController extends Controller
{

    private $classificacao = NULL;

    // Construtor da Classe
    public function __construct(Classificacao $classificacao) {
        $this->classificacao = $classificacao;
    }

    // Retorna as equipes para exibir a classificação do campeonato
    public function getClassificacao() {

        return view ('classificacao',[
            'dados'   => $this->classificacao->getClassificacao(),
            'equipes' => Equipe::all()->sortBy('nomeEquipe')
        ]);

    } // FIM getClassificacao

    // Inclui o Resultado de uma partida
    public function incluirResultado(Request $request) {

        // Validação dos dados
        $regras = [
            'placarVisitante' => 'required|integer|gte:0',
            'placarMandante'  => 'required|integer|gte:0',
            'mandante'  => 'required|integer',
            'visitante' => 'required|integer'
        ];

        $validador = Validator::make($request->all(),$regras);

        if ($request->filled('mandante') &&  $request->filled('visitante')) {

            if($request->mandante == $request->visitante) {
                return response()->json([
                    'message' =>  'Não é permitido selecionar o mesmo time como mandante e visitante',
                    'success' => false
                ]);
            }
        }

        if($validador->fails()) {
            return response()->json([
                'message' =>  $validador->messages(),
                'success' => false
            ]);
        }

        // Retorna a pontuacao do mandante e visitante
        $pontos = $this->getPontosPartida($request->placarMandante,$request->placarVisitante);

        // Inclui ou atualiza a pontuacao do clube no banco de dados
        $this->classificacao->atualizaClassificacao($request->mandante,$pontos['pontosMandante']);
        $this->classificacao->atualizaClassificacao($request->visitante,$pontos['pontosVisitante']);

        // Insere os placares dos clubes mandante e visitante
        $confronto = new Confronto();
        $confronto->id_mandante   = $request->mandante;
        $confronto->id_visitante  = $request->visitante;
        $confronto->golsMandante  = $request->placarMandante;
        $confronto->golsVisitante = $request->placarVisitante;
        $confronto->save();

        return response()->json([
            'message' =>  'Resultado postado com sucesso ',
            'success' => true
        ]);
    } // FIM incluirResultado

    // Retorna a pontuacao do mandante e visitante
    public function getPontosPartida($golsMandante,$golsVisitante) {

        if($golsMandante > $golsVisitante) return ['pontosMandante'  => 3 , 'pontosVisitante' => 0];
        if($golsVisitante > $golsMandante) return ['pontosMandante'  => 0 , 'pontosVisitante' => 3];
        if($golsVisitante == $golsMandante) return ['pontosMandante' => 1 , 'pontosVisitante' => 1];

    } // FIM getPontosPartida

} // FIM ClassificacaoController class
