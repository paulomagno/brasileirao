<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Campeonato Brasileiro</title>
    <!-- Bootstrap JS -->
    <script src="{{ asset('js/app.js') }}" type="text/javascript"></script>
    <!-- Bootstrap CSS -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <!-- CSS Aplicação  -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>
<body>
    <div id="dados" class="container-fluid">
        <div class="row align-items-center">
            <div class="col-sm">
                <img width="250px" class="rounded float-start" src="https://logospng.org/download/brasileirao-serie-a/logo-brasileirao-2048.png" alt="">
            </div>
            <div class="col-sm">
              <h1 class="primary">Tabela</h1>
            </div>
            <div class="col-sm text-center">
                <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#confrontoModal">
                  Inserir Confronto
                </button>
            </div>
        </div>
        <p></p>
        <table class="table table-hover table-borderless">
            <thead class="table-light">
              <tr class="table-light">
                <th scope="col">Posição</th>
                <th scope="col">&nbsp;</th>
                <th scope="col">&nbsp;</th>
                <th scope="col">PTS</th>
                <th scope="col">J</th>
                <th scope="col">V</th>
                <th scope="col">E</th>
                <th scope="col">D</th>
                <th scope="col">GP</th>
                <th scope="col">GC</th>
                <th scope="col">SG</th>
              </tr>
            </thead>
            <tbody class="table-light">
                @php
                  $posicao = 1;
                @endphp
                @foreach ($dados as $dado)
                    <tr scope="row" class="{{classificacaoBrasileirao($posicao)}}">
                    <td  scope="col">{{$posicao ++ . 'º'}}</td>
                    <td  scope="col"><img src="{{$dado->escudo}}" width="30px" height="30px" alt=""></td>
                    <td  scope="col">{{$dado->nome}} - {{$dado->uf}}</td>
                    <td  scope="col">{{$dado->pontos}}</td>
                    <td  scope="col">{{$dado->totalJogos}}</td>
                    <td  scope="col">{{$dado->totalVitorias}}</td>
                    <td  scope="col">{{$dado->totalEmpates}}</td>
                    <td  scope="col">{{$dado->totalDerrotas}}</td>
                    <td  scope="col">{{$dado->totalGolsMarcados}}</td>
                    <td  scope="col">{{$dado->totalGolsSofridos}}</td>
                    <td  scope="col">{{$dado->totalGolsMarcados - $dado->totalGolsSofridos }}</td>
                    </tr>
                @endforeach
            </tbody>
          </table>

          <!-- Modal Confronto -->
            <div class="modal fade" id="confrontoModal" tabindex="-1" aria-labelledby="confrontoModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="confrontoModalLabel">Confronto</h5>
                    <button type="button" class="btn" data-dismiss="modal" aria-label="Close">X</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm">
                               Mandante
                            </div>
                            <div class="col-sm">
                               Placar Mandante
                            </div>
                            <div class="col-sm">
                                Placar Visitante
                             </div>
                            <div class="col-sm text-center">
                               Visitante
                            </div>
                        </div>
                        <form class="row g-5" method="POST">
                            @csrf
                            <div class="col-sm">
                                <select name="mandante" class="form-control form-control-md">
                                <option value=''>Mandante</option>
                                    @foreach ($equipes as $equipe)
                                        <option value="{{$equipe->id}}">
                                            {{$equipe->nomeEquipe}} - {{$equipe->ufEquipe}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-sm">
                                <input type="number" min="0" name="placarMandante" class="form-control form-control-md" >
                            </div>
                                X
                            <div class="col-sm">
                                <input type="number" min="0" name="placarVisitante" class="form-control form-control-md" >
                            </div>
                            <div class="col-sm">
                                <select name="visitante" class="form-control form-control-md">
                                  <option value=''>Visitante</option>
                                    @foreach ($equipes as $equipe)
                                        <option value="{{$equipe->id}}">
                                            {{$equipe->nomeEquipe}} - {{$equipe->ufEquipe}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="button" id="salvar" class="btn btn-primary">Salvar Mudanças</button>
                    </div>
                </div>
                </div>
            </div>
            <!-- Fim Modal Confronto -->
    </div> <!-- Fim Div Container -->
</body>
</html>
<!-- Salva o resultado das partidas -->
<script type="text/javascript" src="{{ asset('js/scripts.js') }}"></script>

