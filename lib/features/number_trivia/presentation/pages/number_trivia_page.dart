import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_template/features/number_trivia/presentation/widgets/message_display.dart';
import 'package:flutter_template/injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter templete'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return const MessageDisplay(message: "Start searching!");
                  }
                  return MessageDisplay(message: "Start searching!");
                  // We're going to also check for the other states
                },
              ),
              SizedBox(
                height: 20,
              ),
              Placeholder(
                fallbackHeight: 40,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    // Search concrete number
                    child: Placeholder(
                      fallbackHeight: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    // random button
                    child: Placeholder(
                      fallbackHeight: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
