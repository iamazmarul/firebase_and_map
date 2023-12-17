import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatefulWidget {
  final String matchName;
  const MatchDetailsScreen({super.key, required this.matchName});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('match').doc(widget.matchName).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final score = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: Text("${score['team1']} vs ${score['team2']}"),
              ),
              body: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${score['team1']} vs ${score['team2']}",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 30
                            ),
                          ),
                          Text(
                              "${score['goals1']} : ${score['goals2']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35
                              )
                          ),
                          Text(
                              "Time : ${score['match_time']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22
                              )
                          ),
                          Text(
                              "Total Time : ${score['total_match_time']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          else if(snapshot.hasError){
            return const Scaffold(body: Center(child: Text("Unable to fetch data"),));
          }
          else{
            return const Scaffold(body: Center(child: CircularProgressIndicator(),));
          }

        }
    );
  }
}
