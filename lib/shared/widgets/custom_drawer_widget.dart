import 'package:dio_flutter_navigation_app/pages/login_page.dart';
import 'package:dio_flutter_navigation_app/pages/registration_data_page.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Camera'),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Galeria'),
                          leading: const Icon(Icons.photo_library),
                        ),
                      ],
                    );
                  });
            },
            child: const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 0, 162, 255),
                    Color.fromARGB(255, 3, 103, 161),
                  ],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('lib/images/user1.jpg'),
                child: null,
              ),
              accountName: Text('Judenilson'),
              accountEmail: Text('email@email.com'),
            ),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    Text('Dados Cadastrais'),
                  ],
                )),
            onTap: () {
              Navigator.pop(
                  context); // remove o menu lateral para não atrapalhar quando voltar p MainPage
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationDataPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.assignment),
                    Text('Termos de uso e privacidade'),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: const [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Termos de uso e privacidade',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '- Todos os Tripulante devem manter a discrição e a ética no que diz respeito a assuntos, atividades e informações da VASPv.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                '- O Tripulante é totalmente responsável por suas senhas pessoais de acesso aos sistemas, respondendo direta e pessoalmente por todas as ações que venham a ocorrer em consequência da sua utilização.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                '- O Tripulante deve utilizar os sistemas corporativos e outros recursos de informática apenas para atividades, sempre respeitando os interesses e valores da Companhia. Não é permitido o uso de sistemas da VASPv para benefício próprio ou de terceiros, nem o uso de informações técnicas sem sua autorização do departamento de Tecnologia.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                '- Lembre-se: o clima agradável de suas atividades é fundamental. Para sua garantia, não é permitido ofender, expor, desqualificar ou realizar comentários impróprios sobre a Companhia, Tripulante e terceiros, bem como divulgar fotos que afetem a integridade da imagem da VASPv via redes sociais, ferramentas corporativas ou qualquer outro meio de comunicação.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                'Ações que são expressamente proibidas:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '- Agredir verbalmente qualquer pessoa, seja colega de companhia, subordinado ou tripulante.',
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                '- Violar a privacidade de outro Tripulante.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                '- Permitir o acesso de terceiros aos serviços da Companhia sem a devida aprovação.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                '- Utilizar nossa mídia eletrônica para fazer propaganda de produtos, serviços ou qualquer atividade de interesse pessoal, em benefício próprio, de outras pessoas ou de organizações.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                '- Enviar ou retransmitir correntes de mensagens e ou assuntos não éticos.',
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                '- Utilizar endereço eletrônico e grupos de e-mail da companhia para envio de mensagens polêmicas ou provocações aos Tripulante, subordinados e lideranças.',
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    Text('Configurações'),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text('Sair'),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text('VASP Virtual - CEOP'),
                      content: const Wrap(
                        children: [
                          Text('Deseja sair realmente?'),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Não')),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text('Sim')),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
