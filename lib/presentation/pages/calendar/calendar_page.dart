import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/notifications/notifications_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

  String selectedType = 'Emploi'; // Default dropdown value

  final Map<String, Map<String, List<Map<String, dynamic>>>> schedules = {
    'Emploi': {
      '2025-04-20': [
        {
          'start': '8:00',
          'end': '10:00',
          'subject': 'Mathématiques',
          'teacher': 'Chaima Ben Farhat',
          'color': const Color(0xFF42C7C7),
        },
        {
          'start': '10:15',
          'end': '12:15',
          'subject': 'Informatique',
          'teacher': 'Chaima Ben Farhat',
          'color': const Color(0xFFF5F5F5),
        },
      ],
      '2025-04-21': [
        {
          'start': '14:00',
          'end': '16:00',
          'subject': 'Arabe',
          'teacher': 'Chaima Ben Farhat',
          'color': const Color(0xFFF5F5F5),
        },
      ],
    },
    'Réunions': {
      '2025-04-20': [
        {
          'start': '16:00',
          'end': '17:00',
          'subject': 'Réunion parent-prof',
          'teacher': 'Mme Amina',
          'color': Colors.orange.shade100,
        },
      ],
    },
    'Absences': {
      '2025-04-21': [
        {
          'start': '-',
          'end': '-',
          'subject': 'Absence - Mathématiques',
          'teacher': 'Justifiée',
          'color': Colors.red.shade100,
        },
      ],
    },
  };

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR');
  }

  // Schedule per date
  final Map<String, List<Map<String, dynamic>>> schedule = {
    '2025-04-20': [
      {
        'start': '8:00',
        'end': '10:00',
        'subject': 'Mathématiques',
        'teacher': 'Chaima Ben Farhat',
        'color': const Color(0xFF42C7C7),
      },
      {
        'start': '10:15',
        'end': '12:15',
        'subject': 'Informatique',
        'teacher': 'Chaima Ben Farhat',
        'color': const Color(0xFFF5F5F5),
      },
    ],
    '2025-04-21': [
      {
        'start': '14:00',
        'end': '16:00',
        'subject': 'Arabe',
        'teacher': 'Chaima Ben Farhat',
        'color': const Color(0xFFF5F5F5),
      },
    ],
  };

  List<Map<String, dynamic>> getScheduleForDate(DateTime date) {
    final dateKey = DateFormat('yyyy-MM-dd').format(date);
    return schedules[selectedType]?[dateKey] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final daySchedule = getScheduleForDate(selectedDate);

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed.withAlpha(
                          (0.25 * 255).toInt(),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                  const Text(
                    "Clubs & Activités",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.darkText,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationsPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed.withAlpha(
                          (0.25 * 255).toInt(),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Date Info + Emploi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('d').format(selectedDate),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.EEEE('fr_FR').format(selectedDate),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        DateFormat.yMMMM('fr_FR').format(selectedDate),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCF5EB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedType,
                        items:
                            ['Emploi', 'Réunions', 'Absences']
                                .map(
                                  (type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(
                                      type,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedType = value!;
                          });
                        },
                        icon: const Icon(
                          Icons.expand_more,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Calendar
              TableCalendar(
                locale: 'fr_FR',
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2030),
                focusedDay: focusedDate,
                currentDay: selectedDate,
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableGestures: AvailableGestures.horizontalSwipe,
                headerVisible: false,

                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },

                onDaySelected: (selected, focused) {
                  setState(() {
                    selectedDate = selected;
                    focusedDate = focused;
                  });
                },

                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.black54),
                  weekdayStyle: TextStyle(color: Colors.black54),
                ),

                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  todayDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.primaryRed.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  defaultDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),

                  weekendDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),

                  outsideDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),

                  holidayDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),

                  disabledDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),

                  markerDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),

                  rangeStartDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  rangeEndDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  withinRangeDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),

                  // Text styles
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  todayTextStyle: const TextStyle(color: Colors.white),
                  defaultTextStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  weekendTextStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Heure",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "Cours",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Courses of the day
              Expanded(
                child:
                    daySchedule.isEmpty
                        ? const Center(
                          child: Text(
                            "Aucun cours pour cette date.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                        : ListView.separated(
                          itemCount: daySchedule.length,
                          separatorBuilder:
                              (_, __) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final course = daySchedule[index];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 55,
                                  child: Text(
                                    '${course['start']}\n${course['end']}',
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: course['color'],
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              course['subject'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              'Prof : ${course['teacher']}',
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.more_vert,
                                          size: 20,
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color),
      ),
    );
  }
}
