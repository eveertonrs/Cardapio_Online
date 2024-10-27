import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> categorias = ['Entradas', 'Pratos Principais', 'Sobremesas', 'Bebidas'];
  String categoriaSelecionada = 'Entradas';

  final List<MenuItem> itensCardapio = [
    MenuItem(
      nome: 'Pizza Margherita',
      descricao: 'Pizza com molho de tomate, mussarela e manjericão.',
      preco: 20.0,
      imagemUrl: 'https://s2-receitas.glbimg.com/aOqutzWVjENKMw1htEAzVs33CpE=/0x0:1200x675/1000x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_1f540e0b94d8437dbbc39d567a1dee68/internal_photos/bs/2024/h/r/EfCbvqTbeDRAD3Lzc5xA/pizza-margherita.jpg', 
      categoria: 'Pratos Principais',
    ),
    MenuItem(
      nome: 'Espaguete Carbonara',
      descricao: 'Espaguete com molho de ovos, queijo e bacon.',
      preco: 18.0,
      imagemUrl: 'https://s2-receitas.glbimg.com/0n5TfNF-Wn-PEL0wVhM7gkbLEiE=/0x0:1200x675/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_1f540e0b94d8437dbbc39d567a1dee68/internal_photos/bs/2024/U/o/zTrs7hQ9iu0pdHv0BjdA/espaguete-a-carbonara.jpg',
      categoria: 'Pratos Principais',
    ),
    MenuItem(
      nome: 'Salada Caesar',
      descricao: 'Salada com alface, croutons, queijo parmesão e molho Caesar.',
      preco: 15.0,
      imagemUrl: 'https://p2.trrsf.com/image/fget/cf/1200/630/middle/images.terra.com/2023/02/28/whatsapp-image-2023-02-28-at-01-53-47-(1)-1iyhprrq5e9tc.jpeg',
      categoria: 'Entradas',
    ),
    // Adicione mais itens com categorias diferentes
  ];


  @override
  Widget build(BuildContext context) {
    // Filtra os itens da categoria selecionada
    final itensFiltrados = itensCardapio.where((item) => item.categoria == categoriaSelecionada).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: Column(
        children: [
          // Lista de Categorias
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                final bool isSelected = categoria == categoriaSelecionada;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(categoria),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        categoriaSelecionada = categoria;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            // Lista de Itens do Cardápio Filtrados
            child: ListView.builder(
              itemCount: itensFiltrados.length,
              itemBuilder: (context, index) {
                final item = itensFiltrados[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.imagemUrl),
                  ),
                  title: Text(item.nome),
                  subtitle: Text(item.descricao),
                  trailing: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                  onTap: () {
                    // Implementar navegação para detalhes do item
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
