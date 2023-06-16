import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz2.dart';
import 'package:quiz/screens/quiz3.dart';
import 'package:quiz/screens/quiz_page.dart';

import '../bloc/quiz2_bloc.dart';
import '../bloc/quiz3_bloc.dart';
import '../bloc/quiz_bloc.dart';

class HomePage extends StatefulWidget {
  final QuizBloc quizBloc;
  final Quiz2Bloc quiz2Bloc;
  final Quiz3Bloc quiz3Bloc;



  const HomePage({
    required this.quizBloc,
    required this.quiz2Bloc,
    required this.quiz3Bloc,
  });

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;
  @override
  void initState() {
    scrollController.addListener(() { //scroll listener
      double showoffset = 10.0; //Back to top botton will show on scroll offset 10.0

      if(scrollController.offset > showoffset){
        showbtn = true;
        setState(() {
          //update state
        });
      }else{
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quizes'),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 500),  //show/hide animation
        opacity: showbtn?1.0:0.4, //set obacity to 1 on visible, or hide
        child: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo( //go to top of scroll
                0,  //scroll offset to go
                duration: Duration(milliseconds: 500), //duration of scroll
                curve:Curves.fastOutSlowIn //scroll type
            );
          },
          child: Icon(Icons.arrow_upward),
          backgroundColor: Colors.redAccent,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Center(
          child: Column(

            children: [
              GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2.7,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      ),
                    height: MediaQuery.of(context).size.height / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(quizBloc: widget.quizBloc),
                          ),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.green[100],
                        shadowColor: Colors.blueGrey,
                        elevation: 20,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Container(
                                height: MediaQuery.of(context).size.height / 7,
                                child: Image.network(
                                  'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxESEhUSEhIWFhUXFRgWGBgVFx0XGBYYFxkYFhgXFxgYHSggGB4lGxcXITEhJS0tLjAuFx8zODMtNygtLisBCgoKDg0OGxAQGy0mICYuLy01Mi0tLTA1Ky8tLS0wLy0uLS8vLy0tLSstLS0tKy0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKsBJgMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABQECBAYHAwj/xABLEAACAQIDBQMHBgwDBwUAAAABAgMAEQQSIQUGMUFREyJhBzJxgZGhwSNCUpKx0hQzNFNUYnJzk7LR8BXC4RYXVYPD0/ElNUOCs//EABoBAQACAwEAAAAAAAAAAAAAAAAEBQIDBgH/xAA0EQABAwIEAwYFBAIDAAAAAAABAAIDBBESITFRQWHwE3GBkaHRFCKxweEFMlLxQmIVJDP/2gAMAwEAAhEDEQA/ANKpSldOuaSlKURKUpREpVK3LcDctsa/aygrhlOp4GUj5inp1b1DXUYSSNjbidos443SOwtV3k+3KbGN20wIwyn0GUjiqn6I5t6hrcjt0MSqoVQFUAAACwAGgAA4CqYeFUVURQqqAoVRYADQADkK9qop53TOudNleQQtibYa7pVDVaoa0LcqVdSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlESlKURKUpREpSlEXyzSlK6dc0lKUoiVSlbXuLuc+PkzPdcOh77cC5+gnj1PL02rCR7WNxO0WbGOe7C1X7ibmvjn7SS64ZT3m4GQj5iH7W5enh3LC4dI0WONQqKAqqBYADgBTCYVIkWONQqKLKo0AAr3qiqKh0zrnTgruCBsTbDXiUpSlaFvSlKURKpeq1Q0RL1WqCq0RKUpREpSlESlKURKVQ1p20vKJgIZDHeSQg2YxqCoI46kjNbwvWbGOebNF1i57WC7jZblSo3Y+2IMVH2sDhlvY8ipHEMDqp9Ncz2hvBjtp4lsPgXMUK37ysUuoNu0kkXvAE8FXrwOts44XPJBytrfgsHzNaBxvpbiuvUrk+0t09pQwySjaUjlEZ8geW7ZQWIBznWwNtPZWi/4/i/0uf+PJ96t8dH2ouxwPn7LTJV9mbOaR5e6+kqV82/7QYz9Ln/AI0n3qf7QYz9Ln/jSferZ/xsm49Vr/5CPY+nuvpKlcH3Vjx+PlaNMdMgVMzMZZGA1AAsHGpJPP5prYNpbubVwqGeHaEkpQFiud72AuSEdmV7DWx6c60vpQx2AvF/H2W1tSXNxBht4e66xStW3C3m/DsOWcASxnLJbgbi4cDkDrp1Br0ixc2Jc5HMcYvYganh7Tre3KoNQ/sXYHD5tLdZWUhjg4Bw0Wy0qBwONlSbsZTmDeaxFtbXt48fbU9XkUokBI4ZdyySlKVsRfLNKUrp1zSVSq1se5e6cuPltqkKH5ST35E6sfcNTyBxe8MbidosmMLzhbqr9x90ZMfJc3WBD8o/XnkTqx68hr0B7vgcHHDGsUSBEUWVRwArxweFiw0QjjURxounQDmSeZ5knUmoLGbxSFj2VgvK4uT4np6Kp3ukqnZaDrzKtQYqRoxHM+Z/C2ylaWd4cR9IfVFT+yGnZc0xFj5q2sbdT/StUlM+MXcQs4axkrsLAfb1UrSlKjqWlKUoiUpSiJSlKIlKUoiUpSiJSlKIoXe13XBYgx3ziF7EcR3TcjxteuNbt4G8U0uUE9m6JcHS6MC0ZsQxvYEcQD+tXfiK0fG7gYUSFop5cOHNzHFIFU/sg8PRqByFSqedrGFp42/pRp4S9wcOF1rXktV0xGLRSTEsJDGxW7BrIcp1U27TQ9KyvI2g7Cc21zRi/OwQ2HvPtretmbDgwcDxwqdQzMzHM7tY95m5n3Vo/kb/ACef94n8lbZJRIyRw3b6X9lrjj7NzGnZy6BWIdk4a9/weG/7pPu1l0qBdTVif4Vhv0eH+En3af4Vhv0eH+En3ax9qbVyHJHYtz6D1c6y8F2uW8vE8rWt6fGtxje1geTr5qOyojfKY25ka5ZDlffl+bX4fDRxi0aIgOpCKFB9OUV7qNR6atq6PiPSK0lSAue+R2MCTHLy+TFvDNMK2fCYlsIzRyL3e8VOupsLa+OUeitb8jv43HftR/zTVtGK3rXOUjVWtzZst/EC3DxrdX0zpZy9psWjU2tYgXvcjLLcaKFBMyOJoN7kkAAEk5nQAElemGz4mcS2tFGxKn6XADjx4A+FbHUbsvaKTrddCPOB5X4WPMVJVFjhMVw7MnM9bWtbM5WzUtj2vaHNNwlKUrYsl8s0pU9uhuvLj5ci3WNbdpJbRR0HVjyHrrpXvDBicclzjGF5wt1V+5u6suPlyi6xKflJLcP1V6sfdxPQ92wGChw0SxxqEjQf6kk8yeJJ41TZmAhwsKxRKEjQf6lmPMniTWuba2qZjlXSMH6x6nw6D+xUOc+rfYZNHXmVZkx0cdzm4+v4CptrapmOVbiMHT9Y9T8BUXStg2Dsa9pZRpxVTz8T4dBU1zmU7OSqmtkqZOfoB1oPyVXYOxr2llHiqn7T8BWzUFVqolldI7E5X8EDYW4W/wBpStW3rxeIE+Ghgm7Ptc4JyhhcZLE3B6n21T/B9qf8QH8Jf6VrW5bVStW2xjZ4ZsBF2vnnLKQB8oR2YJ1GnFuHWtpoiUpUbt/aJw0DzBc2XL3SbXuwXjY9aIpKlY2BxHaRJJa2dFa3G2YA299YGytrmafEQlAohZQDe+bNm4i2nm0RTFKVaCDwoiupSqXoirSlKIsbG4js43ktfIjNbrlBNvdXPdl7DkxwkxEkgOrKbgkk5bi3RQWHdHS2ldIdQRY6g6GtUXdrEQswwuI7ONjcqwuRy42N9PRwHHjU6km7NjgHBrjaxO3EZA23UWoixlpIxNF8h6FeG5GPd4ZomJIRbqTyDBhl9Ay6emoLyN/k8/7xP5K3XZmxlw0EiglmZWLufnGx5cgPia0vyOfk8/7xP5BWU0jHiVzNCW/dYRMcwxtdrZ32W/1ibWkkWO8Y15kch1tz+H2YM29WDR2Rpe8pKmyOwBGhFwtjrVYd58K7KquxZiFACtqToKhgFhDnDzVm+gqZIzhY8XGoacueix4FTD2L2aW1wl/MHW/9/GpVcdaNpZQI0VSxJN+6NbkW9nM1rO+uycUB2uCBLlwXA1cDrHfQi/Echw04ZIOKx2BlhmgaDEFQO8LI7KQwKnkCVsRyvzFSpMEga4nUi54jPgNh481T00b4i5gFgNAP8uZdudsl5wb+4dmGaKRIy2XtTYgG1+8oOmhvoSbcq26PiPSK5Sdj4iQmKPDyrcZQrxhUQ3PeL3I0DcRqbV1DAw9mkcd75FRL9coC391K2GGPD2fG+V793QuNlIpZJHXx8uFuvqtA8kyFm2go0JCAeBJmFVnjkWTSMXBAa55gcK9PI4flcb/y/wCaatj2pvPgBIVdTKVNiyqGAI4i5IzW8L15VVEMUrhMAWnCc9wBbv377FY01HUzNDqb9wDm6E/K52eli05WBBvmRxur9z4Gu8lrKQAPE3JPs+NbVWHgMTHJGrxEFCO7bQdLW5W4W5VmVGll7V5futlLTfDRCLbwz7uFtLJSlK1qQvnXdLdibHS5E7sa2MkltFHQdWPIV3rZezocLCsUShI0HPn1ZjzJ5muAbsbxTYGYSxG6nR4ye7IvQ9COTcvEEg952HtmHGQiWE3U6Mp4qeaOOR19ehFwasf1DtLi/wC3rVV9CWWIH7uvRQe2trGY5E0jB+sep8Og/sRNTG3NkGM50HyZ4/qf31r12FsfNaWQd3iqnn4n+9fRx3slijixN09b+/WllXPhnlnLXfu9Lbjlt73VdhbHzWllHd4qp5+nw8Of2zGL2xDE2Rm152BNvTbnWBt/bqwns0PyhHHknS/j4es8r6uTfWtLIHTntJMhw7uvNSJKllKOyhsTxJ368luP+0WH+kfqmsvBbQSW+S5txJBA99afsvZzTNYaKPOboP6+FbrhMOsahEFgPf4nxrRUxRRfK29/p6KTRzTzfM6wb3a92fqtU31xDR4rBOqGRlMpCLxbzNBoa9xvRiv+Gze0/wDbq7eX8vwH7Uv+StqqIrBalvZ+WbP/AHjfbHV0LH/GHFzb8G4X04pyq3ez8s2f+8b7Y6x9qYpcLtRZpbiOSDIGtcA3F726ZR9YURZvlFYjBOQSDmTgbc6xd+NmI2HOILPmREUKD3Dd184W1PePPpWDv7t+GbDmGBu01Duy6qig2F24XLED21Pb2xltnyAC9kQ+pWVifUAT6qIsfYe7UQgzdpL8tAobvju5gGOTu6VCbE3bilxGKiaSUCJlAKsAxuXHeOXXhW0bsbVglhijRwXWFcy63XKFU39ftqF2ZtKLDY7GidxHmKspbgQMzfYwoit3gxiz4s4WWcQ4eNQX7wUyMQDlueOjDTwPhbA2jDhcKonwOKUSKReMSBhIL2IIvc9bdL89aztqpFhsc0uJiV4J1FmZM4RwAOBB6HhyPga9tobT2coVYMPDPIxAVEjXXXW7ZdNOXwuQRWb24x5PwF4TlaRrrroC/Z5b9bE1LbH3Xiw8gmDyPLYhmYg5i3EnS/v9tR+9KBZtnAKFAmUBRay96LQW00rcaIlajid8srFVgvY2uXt7gprbq5jvNh+yxMi8icw9Da/bceqp9BDHK8teL5c1ErJHxtBaePL7qfw++YLAPDYEgXV72vzsQK2qCVWF1IIuRcdQSCPUQR6q5LCRmFzpcX9F9al4trSYdkeM3UoGZCe62ZnYjwOvGpVT+ntJHZZHxz+qjQVjh/6ZhdBx34t/2G+w1zPyQLfC4gAlbuoBHEfJjUeIveuhLi1mw5kXg0ZNjxF1OhrRfIooOHnuP/lX/wDMVXsBEMgO7fuprjeVhGx+yycDuq7Fu0kZAr5R3QS4HNddAeRPsracPg40ACoBYWvYZumrcSa9HkxAJy4aMi5sTNa45G3Zm1X4EysT2sCRgWtlk7S/G9+4tuXXjWlzHDMn1H0up1RWvqD82mwFh9PqcuCUrzdsRc5cPERfQmYi45adkbV64MzMW7WKNBplySGS/G97xrbl140LCBe48wfQFRg4E2z8iqVcnEekV5SHE65cPCel52H/AETXtge1N+1jjW1suRy9+N73RbcutHRkC+XmPoCvQ4E/grnPklQlseFNiQgB6EmaxqmwYcNGx/C2VWRgSpDCQMp1SwUrIjC4PPX0GvbyNj5XG/8AK/mmro0uCichnjRmHAsoJHoJFefqUOOoxDUW17h7DrMbf0uqEMDmOBs7Y2ORPGxyzz9rgwW4+FMeHf6DTO0d7/i9FVtdbG19fTWz0pWqNgY0NHBezSmWQyHiUpSlZrUvlipjdfeKbAzCWI3U2EkZPdkXoehHJuXoJBiKV0zmhwLXDJc41xabjVfSOw9rw42ASxHMrcVPFTzRxyPuPEXBry3jx8kEWaNdSbZuSeJHuHL7DwvdbeObATCSM3U6SRk92RfgRybl6CQe8bI2rDjYRLEQyMLMrcVPzkccj/eoNUs0HYSBxF236Hf9VbsmNRGWtOF1uj1puucliSSTcnUk6kk8ya9sNjoleOOaQRh2yhm5enw8ToLi9Zm+uz/wJTOilor2AHFWOgVjyW/zj6ONr8sxWJeVi7m5PsA6DoKuRI2Vl2/11sudbSvjkIkGnr47H0719K4TCpGoRBYD2k9T1NZFcn8nW/GTLhMU3d82KVj5vRHJ5cgeXDhw6vVBNE+N9nee66mGRj2As8tuS8ngRiGZVJXzSQCVv0PKvaozbmPMMYKlA7METtDlTMbsbm/JVY+qvNttqVVo43kDRCa6ZdEP7TC504VrDHEXCzxC9lIyQIxBZVJXVSQCV9BPDgKpisLHKuWRFdejAMPYaj/8ZTMQEcoJI4zJ3cuaRY2SwzZiD2iC9uLdASLsVPOZjHE0agRh++he5LMLXDrbzfHjTCeKYlkxbNgVCiwxhCblQgyk9SLWNZduVQA3niAQOMrMqMwzL3M7FNMxBezK3mi9he2oB98Rt+JFDMG4Ncd0ZWWRYcjEtYEyNlGttCb2F697N2yY27rNwuzoIiWjijQniUQKTz1IFMXs2CUgyxRuRwLoGI9oqMTb6Mcw8xFmMgFnN4xGwylCQ3de+h520IIrIbbFjlaGQSXQZO4SRJmytcPltdGB10ynlYnwscOCYwpKaFXUqyhlPEMAQfSDXhhdmwRG8cMaE80QKfaBWE22xcKIZC9pSUGS69kUDXJcDXtFIsdb8qtbeGMKXdHQZY2XMUGcSsVSxzWXUa5rWB9NmB2yYgpWWBGILKpKm6kgEqeovw4D2V7VCRbcV8vZxu7MJDZShA7JkVu9nym+dbWJ48tayNnbT7ZyFRsmSN1ckWYSLmGl7jQ9OR8KFpGqYgpOtQ35gVQk50IOUns1kvxZb5mAAFjyPGtvrDx+DSaNopBdWGo4eIII4EHnWcEvZSB/D7LGZmNhaFySfEZmJve/6oXw81dB6qdpUptCXCwSSQfgJMiEgFp3YEcVewsdRY299QHaV1ETsQuAQOdvsSqGRtjmb+eXmAtnwO18kkrKT2XZZSOZCoI47D6VwPaaxvJVijFgMXItiVcEX4X7NbXqMw2OCI5Gr27vRTYgserAEhRyLE8tczycD/03G/tD+Rag1cQtpqWjvsfza/spUEhxa8HHxKlZd98SPmx/UP3qxJd/8YOAi+qfvVj4ct2fdEh75B7MkEDKtibcSNbA6HXWrdoRyd4kyBeyckHOY2vG4BLPwe5XukaW45tK2uipwbFg68F4JZrXxFbfuJvBNjFlMwS6MoBQFbhgeIJPT31MvteFSVJe4JBtFIdRodQljWp+SfzJ/TH9jVPYvGMs6wfhmV5LlF7EHTUgZuF7A8elVNRCwVD2gZDPK+1zoCp0Mjuxa4nM7+nELMbb8A5yeqCU/Yle+A2hHLfJn7tr54nj43tbOovw5Vg4HbcWWVWmLtBftWKZdLtqABY8CNOnjWfszHx4iNZYmupvysbgkEEHgQQajSx4QflI7+641A1Gi3seCRmOvHgclz3yN/jMb6Yftmrp9ct8j7hXxxJAA7IknkAZr3rYNubyMyH8HJVc1s/Am1r5eg7w8alTQvmqCG8s+GijxStjhBdz+pW5Urlg2tib6TyE8u+dTyFr103DqwVQxuwUAnqban21rqqQ09rkG62QVAmvYEWXtSlKiKQvlmlKV065pKmt1d5JsBN2keqmwkjJsrr8GHI8vQSKhapXjmhwLXDJZNcWm41X0hszaGHxuHzpZ43BVlYA2uO8jr114fCudbZ8lcvascLJH2R1USswZOq3CNmA5Hj14XOobp7yzYCbtE7yNYSRk6OB9jDWx+FxXe9jbVhxUSzQtmRvaDzVhyI6VUSNkpHXYcj1nzVqx0dU2zxmOsuS5P8A7qsf+cw/13/7ddB3OwGOw8fY4topFUfJujszgfQbMguByN78q2elR5KmSRuF1vJb46dkZu2/msdsMrOrnUqGA6d7Lc26921/E9ajH2GC7WZljZGUhGsTndndeGgObQixHIipulaQ4hbi0FQ0Wxx2kjMTlMqSKgPdOSOJVLC2hVo7gA20W9ZeK2ervnzupK5DkbLdQSbXtccTqCDWdSmIpYKPXZaKVMZaPKqpZCLMiXyqQQeFzqLHXjVrbIiJlNjeUqW1OhQ5lKfRIbvaczepKl6YjumEKPfZisLSM0nddCWIBKyWDDuAW80cKxsTse+Uh3LdojM7N3ssebKFsLaFjpbW5ve9TNK9DihaFGwbLRSGuxbLICzG5btWRnJ5Xui25ACwFqPsmMgDvCyxoCDYjsmzIR4g+3npUlSvMR3TCFhxYIAqzMzsqumZrXIcqxuFAHzF5VZg9mpEQULACNY8t7ghBZSdL3A00NZ9YePxXZjQXJ4dPXXouTYLF7msGI8ExWLVNCRmtoPsueVRcu1X1Rhl8RxX1Hj7qx5pQ9yy9487/aD8LV4SsSADwHDqPC/wqbHA0ajrkqSprpHE4TYcuPI8fEG22eawdu4Npu7JI9wNCrGxvqCRwYen3Vo+NhETZe0VyCQQoYZbciWUAn0X9NdDjGdgGJt6enp0rUsZsCLDuwnaRze9yFw8feuRmkfMXJ6Ip1va9WVNKGfK4+AGvjw8SFGha+QlwOWmZzH3684JpND6D9lbR5LcM0uAxca2zNJYX4X7NeNaW8g1t4/G3Gx9wrdfJbijFgMVIoBZZLi/C+RLX9tZfqF8Aw63HncWUujtjN9LH6LLk3KxR/Netj/SsSTyf4w8DF9Y/drLl32xQ/NfVP36xJd/sYOHY/VP3qf97/X1Wf8A1P8AZbRuLu/Ng1lEpS7spAQlgAoI1JA6+6p+TARNIszRqZFFlcjvAa8D6z7TWv7i7fmxaSmbJdGUAoCtwwvqCT099TL7YhUlSXuCQbRSHUaHUJY1TVDZjM7F+7jbu9lYwmPsm204XXsmzIVz2iQdr+M7o7/HzuvE+0164XCpEoSNQqjgqiwHOsFtvwD856oJT/kr3wG0Y5b5A/dtfPG8fG/DtFF+HKtL2ygfMDbnf7ra0svlb0XGN0cVl/C4ybK+W/iyF2Ue0W9dSTYk2y30uTbxNr/yj2Vr2xXs03pH2vU1gMYFa5RHFrZZDYeo3FjXUMaA24HXVlQXubE8lsO6uFSaeP8AUGdhdtcpFtClvOI0zV0qtf3XwKRx5uyRJXAMiqxbKLnKpJZuA420vep8GuerZu0lyvYZZ+quqWPBH37KtKUqIpC+WaUpXTrmkpSlESpzdLeabAS507yNYSRk6OPDow5H4VB0rFzQ4YXaLJji04hqvpbY21YcVEs0LZkb2g81YciOlSFfO26W882Blzp3o2t2kd9GHUdGHI13jY21ocVEJYHDKfap5qw5EdKo6mmMLuXWRV3T1AlHNSNKUqMpCUpSiKxjVauqlqLy2arSlKL1KUpRErxnhDjKw0/vhXtSgNl4QCLFa5jIijZAnHgeJPo5CsOcAfOueduA8Aa2qRAwKkXB0NROLwSICI1OY8OLZRzNuXhUyOoA1/tVFR+nucTgtbytyA0N9zbnuoMjlTHYZcQwkm85FyrYecDxRuTLxOvPhWSkFqycPs534Cw6nT/zXk05LvkOnFbqGi7NhMmrtRkQLHLvK0DevZYRUKEKmqrHoozWuSv0mIHPXSwPAVl+Tr/2zGfvP8iV0DEYLs4JdA142ueB0U20Oh91aP5LcK0uzsVGtszS2F+F+zjOtSGVJfEMf+Lm595v1usnQYJTh4tdltl13d1rY+HLCPuiQ3dgezuCBlSxNuNtbA2B11q3aMb94sZAoie4bOY2vG9jmfQNcr3SNLcc2lScu5WKP5v6x+7WLJ5P8WeBi+sfu1YmWnJvjHp7qKIpbWwFSfko8zEftp/KancZjGXELB+F5HkuUXsQdNSBmOl7KePSsfcfd+XBpKJWQl2BAQkgBRbUkDrU++BiaRZTGpkUWVyBmA14H1n2mqipljdUPdqDpoc7Zag8fFWEMbxC0aEd/wBjso3AbbhyShpjI0F+0YplPFrEACx4EadPGpDZmPjxEayxm6m9jYg3BIIIPAgg0TZsIz2jQdr+Mso7/HzuvE+017YXDJGoRFCqOCqLAc+AqNIYjfCDfw2z055jkt7A+4xEdaemvNfPWygS7qupJAGoFzduZ0rct3MM4d1kw7I6KDmZGBsTbUtpxIsQBcX41Abn7N7aSY5mXIVIZDY3JfSxBuCAdeVud66Fg4uxh7Huk3JZl0U+Cjl8bVeS1LQBGNejrppwO6opICYnPN7WP9b668LA5rJRx5obKuhNvnaa8PHQX0FSuBxxGj6Lyubken+ptUNEBz4c7fCpLCYMseF1+kNNPX9lQJmttn1+egtdI+TF8mu34220zzKnxSrI0CgAcALVSq5dHdfL1KUrp1zaUpSiJSlKIlTW6m8c2Bm7SPVTpJGT3XX4MOR+BIqFqorxzQ4WOiya4tNxqvpLYm14cXEs0LXU8R85W5qw5Ef3pUnXztupvJNgZe0j1Q2EkZNg4+DDkfgTXeNjbWhxUSzQtmU+1TzVhyIqiqaYwnl1kVdU9QJRz6zCkaUpUZSUpSqGiIKrVoq6iJSlKIlKUoioTUPIZPOzEX5Xt7ulTBrA7G59dF4rcDhAe+2vS/2mpKqAWoTai9WLtT8TL+7f+U1znyW4podm4mVQCVlJF+F+ziGtdGxZV0dM6jMrLxGlwRXJNytpLBh8XgZjklzXUE+cy2R0HiMgNuYJtwqZTNxtcLcW+V7KLO7C8Hk7zstgl31xQ4CL6p/rWDLv7jR+b+of61Ezio7EVf8AwkP8B5Kq+Jl/kV1DcTb0uLSUzZbo4AKArowvqLnmKl5NtwqSCXuCQbQyHUaHUJY1qXkqkVUnuQO8nEgfNNTOM2iBMIvw/Iz3KgRoVA1IBciw0B4nlVHUQs+Ie0DIZ5X8dAfsrSGR3YtcTr3b5akKQO8UHSY+jDTH/p1k7P2ik2bKJBltftInj434doovw5VG4PePDBJA2JztDfOzAKW1a2UAANwI7vTxq3Gb5YOPDnEdspFjlS/yjMLjKE43uOPDnw1rQ+LgGOve3nmP8RqMxyW5sg1Lh148FpPkpwYlbGAmxBjIPHiZa3XEbOdNSLjqPj0rXvI7s90gmxDiwmYBfFY812HhmZh/9a6IRXtWbzOt1YLGmFoh1xWu4TDgFWNiL2Kki9utjWwKLaCo2TDBWItccqko+A9AqOSTqtrWNboAPBX0pSvFkvlmlKV065pKUpREpSlESlKURXKan91N45sDLnj1Q2EkZOjgfYw5H4Vr4NXqaxe0OFnaLNri03Gq+ktj7UixUSzQtdT7VPNWHIipCvn7dTeOXBS501RrCSMnRx8GHI/Cu47H2pFiYlmha6t7VPNWHIiqOopzEeXWRV1T1AlHPrMKQqhqtKjKQqAUNVpREpSlESlKURKtC1dSiJUTjY2zEnhy6f6VLVS1AigwtQO8O5uGxjZ2zRyWALpbvW0GdTo1hz0Og1reOzHQeymQdB7KzZI5hu02KwcxrhZwuuVjyWx88Sf4S/fq5fJbD+kt/DX71dTyjpVcord8XN/L6ey1fCQ/xXLv91eHPGd/qJV6+SrDfnpPUqf0rp1qWp8XN/Ir34aL+IXNB5KsL+el9ifdrLwPkwwSMGdpZB9FmCqfTkUE+2ugV4Za8+KmP+RT4eL+IXnBGEAVQFUAAACwAGgAA0A8KylN68wtXJUdb0kjvV4FVpREpSlEXyzSqVWuoXNJSlUoirSlKIlKpVaIlVBqlUrxF7xtWx7q7xy4KXOneQ2DoTo4+DDkfhWsLWRHWD2BwIOizY4tNwvo3ZO04sTEssTZlb2qeasORHSs+uN+S7FOuMWMMQjxuWXkxUd0nxHWux1Qzxdm/CryCXtGYlWlUpWlblWlKURKUpREpSlESlKURKUpREpSlESlKURKtK1dSiK21VAqtKIlKUoiUpSiL//Z',
                                ),
                              ),
                              title: Text(
                                "Flutter Quiz",
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text('Start flutter Quiz'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Quiz2Page(quiz2Bloc: widget.quiz2Bloc),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Container(
                              height: MediaQuery.of(context).size.height / 7,
                              child: Image.network(
                                  'data:image/png;base64,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',
                              ),
                            ),
                            title: Text(
                              "Dart Quiz",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('Start Dart Quiz'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Quiz3Page(quiz3Bloc: widget.quiz3Bloc),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Container(
                              height: MediaQuery.of(context).size.height / 7,
                              child: Image.network(
                                'https://images.unsplash.com/photo-1537202108838-e7072bad1927?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGtub3dsZWRnZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
                              ),
                            ),
                            title: Text(
                              "General Knowledge Quiz",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text('Start this quiz'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Add spacing between the GridView and the FloatingActionButton
            ],
          ),
        ),
      ),

    );
  }
}
