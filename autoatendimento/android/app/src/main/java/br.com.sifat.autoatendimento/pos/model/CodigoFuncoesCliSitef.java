package br.com.sifat.autoatendimento.pos.model;

public enum CodigoFuncoesCliSitef {

    F0(0, "Pagamento genérico. A CliSiTef permite que o operador escolha a forma de pagamento através de menus."),
    F1(1, "Cheque"),
    F2(2, "Débito"),
    F3(3, "Crédito"),
    F4(4, "Fininvest"),
    F5(5, "Cartão Benefício"),
    F6(6, "Crédito Centralizado"),
    F7(7, "Cartão Combustível"),
    F8(8, "Parcele Mais Redecard"),
    F10(10, "Benefício Refeição Wappa"),
    F11(11, "Benefício Alimentação Wappa"),
    F12(12, "Cartão Infocard"),
    F13(13, "Pay Pass"),
    F15(15, "Venda com cartão Gift"),
    F16(16, "Débito para pagamento de carnê"),
    F17(17, "Crédito para pagamento de carnê"),
    F100(100, "Telemarketing: Inicia a coleta dos dados da transação no ponto necessário para tratar uma transação de cartão de crédito digitado"),
    F110(110, "Abre o menu de transações Gerenciais"),
    F111(111, "Teste de comunicação com o SiTef"),
    F112(112, "Menu Reimpressão"),
    F113(113, "Reimpressão comprovante específico"),
    F114(114, "Reimpressão último comprovante"),
    F115(115, "Pré-autorização"),
    F116(116, "Captura de pré-autorização"),
    F117(117, "Ajuste de pré-autorização"),
    F118(118, "Consulta de pré-autorização"),
    F130(130, "Consulta de transações pendentes no terminal"),
    F131(131, "Consulta de transações pendentes em um documento fiscal específico"),
    F150(150, "Consulta Bônus"),
    F151(151, "Consulta Saldo Cartão Presente"),
    F152(152, "Consulta Saldo Cartão Gift"),
    F160(160, "Consultas Cartão EMS"),
    F161(161, "Vendas Cartão EMS"),
    F200(200, "Cancelamento Normal: Inicia a coleta dos dados no ponto necessário para fazer o cancelamento de uma transação de débito ou crédito, sem ser necessário passar antes pelo menu de transações administrativas"),
    F201(201, "Cancelamento Telemarketing: Similar a modalidade 200 só que para a função de cancelamento de transação de crédito digitado"),
    F202(202, "Cancelamento Pré-autorização"),
    F203(203, "Cancelamento da Captura da Pré-autorização"),
    F210(210, "Cancelamento de venda com cartão de Crédito"),
    F211(211, "Cancelamento de venda com cartão de Débito"),
    F212(212, "Cancelamento de venda com cartão Combustível"),
    F213(213, "Cancelamento de Venda com Cartão Gift"),
    F250(250, "Cancelamento de Consulta Bônus"),
    F251(251, "Cancelamento Recarga Cartão Presente"),
    F253(253, "Cancelamento Acúmulo de Pontos Cartão Bônus"),
    F254(254, "Resgate de Pontos Cartão Bônus"),
    F255(255, "Cancelamento de Resgate de Pontos Cartão Bônus"),
    F256(256, "Acúmulo de Pontos Cartão Bônus"),
    F257(257, "Cancelamento Recarga Cartão Gift"),
    F264(264, "Recarga Cartão Gift"),
    F265(265, "Ativação Pagamento Vinculado Cartão Gift"),
    F266(266, "Consulta Cartão Gift"),
    F267(267, "Ativação Cartão Gift Sem Pagamento"),
    F268(268, "Ativação Cartão Gift Com Pagamento"),
    F269(269, "Ativação Desvinculada Cartão Gift"),
    F310(310, "Corresponde Bancário (Pagamento de Contas)"),
    F311(311, "Pagamento de Contas com Saque"),
    F312(312, "Consulta para Pagamento Desvinculado (Genérico)"),
    F313(313, "Pagamento Desvinculado (Genérico)"),
    F314(314, "Recarga Pré Pago Corban SE com Saque"),
    F315(315, "Saque para Pagamento"),
    F316(316, "Cancelamento do pagamento desvinculado (genérico)"),
    F317(317, "Consulta Limites do Correspondente Bancário");

    private int funcao;
    private String descricao;

    CodigoFuncoesCliSitef(int funcao, String descricao) {
        this.funcao = funcao;
        this.descricao = descricao;
    }

    public int getFuncao() {
        return funcao;
    }

    public String getDescricao() {
        return descricao;
    }
}
