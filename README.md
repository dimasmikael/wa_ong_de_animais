# PetAdoption
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/dimasmikael/wa_ong_de_animais/blob/master/LICENCE) 

# Sobre o projeto

PetAdoption é uma aplicação  mobile, construída para o desafio Warrior,  em um processo seletivo da
empresa WaProject.
Esta aplicativo consome as seguintes apis para a informações dos pets: https://thedogapi.com/ 
e https://thecatapi.com/.
A aplicação consiste em uma listagem de pets para adoção, aonde é possível clicar na foto do  pet e
ver as suas informações.
Na parte do login, após validar  o e-mail com sucesso e fechar e abrir novamente o app, o usuário 
fica persistido na memória interna do device.
No appbar da home, é possível alternar entre os temas light e dark.


## Layout mobile
![Mobile 1](https://github.com/dimasmikael/wa_ong_de_animais/blob/master/assets/imagens_app/login.png) 
![Mobile 2](https://github.com/dimasmikael/wa_ong_de_animais/blob/master/assets/imagens_app/home.png)
![Mobile 3](https://github.com/dimasmikael/wa_ong_de_animais/blob/master/assets/imagens_app/menu.png)
![Mobile 4](https://github.com/dimasmikael/wa_ong_de_animais/blob/master/assets/imagens_app/detalhespet.png)


# Tecnologias utilizadas

As seguintes ferramentas foram usadas na construção do projeto:
### Pacotes e ferramentas utilizadas
<table>
  <tr>
    <td>Flutter</td>
    <td>Dart</td>
    <td>Android Studio</td>
  </tr>
  <tr>
    <td>3</td>
    <td>2.17</td>
    <td>Arctic Fox | 2020.3.1 Patch 2</td>
  </tr>
</table>

* [http](https://pub.dev/packages/http)
* [cached_network_image](https://pub.dev/packages/cached_network_image)
* [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)
* [google_fonts](https://pub.dev/packages/google_fonts) 
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [animated_splash_screen](https://pub.dev/packages/animated_splash_screen)

```bash

## Como usar

**Passo 1:**

Baixe ou clone este repositório usando o link abaixo:


https://github.com/dimasmikael/wa_ong_de_animais.git


**Passo 2:**

Abra a pasta do a pasta do projeto na sua IDE.

Android Studio ->File ->Open- localize a abra a pasta do projeto.
VsCode ->File ->Open folder- localize a abra a pasta do projeto.

**Passo 3:**

Execute o seguinte comando no console para obter as dependências necessárias:
flutter pub get 

**Passo 4:**
Execute o seguinte comando no console para executar o projeto:
flutter run

```
# Login no projeto
Para logar no projeto é necessário apenas fazer a validação do e-mail.É feita uma requisição http em https://jsonplaceholder.typicode.com, e é criado uma lista de e-mail, nos quais pode ser utilizados:
 [Sincere@april.biz, Shanna@melissa.tv, Nathan@yesenia.net, Julianne.OConner@kory.org, Lucio_Hettinger@annie.ca, Karley_Dach@jasper.info, Telly.Hoeger@billy.biz, Sherwood@rosamond.me, Chaim_McDermott@dana.io, Rey.Padberg@karina.biz]
 
# Autor
Dimas Mikael
#Linkedin
www.linkedin.com/in/dimasmikaelsouza
```
