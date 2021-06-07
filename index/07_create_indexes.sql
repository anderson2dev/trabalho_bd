

begin;

-- agendamento com horario definido que ainda n�o ocorreu
create unique index if not exists agendamento_nao_concluido_com_horario_de_tempo on agendamento using btree (id)
where agendamento.concluido = false and agendamento.id_bloco_tempo is not null;

-- usuarios do sistema do tipo mentorado
create unique index if not exists usuario_mentor on usuarios using btree (id) where usuarios.tipo = 'MENTOR';

-- avaliacao de uma sess�o
create unique index if not exists avaliacao_sessao on avaliacao using btree(id) where avaliacao.id_agendamento is not null;

-- habilidades de um usu�rio
create unique index if not exists habilidade_usuario on habilidades using btree(id);



commit;