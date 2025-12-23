import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _taskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nueva Tarea',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _taskController,
                style: const TextStyle(color: Colors.white),
                contextMenuBuilder: (context, editableTextState) {
                  return const SizedBox.shrink();
                },
                decoration: InputDecoration(
                  hintText: 'Título de la tarea',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                style: const TextStyle(color: Colors.white),
                maxLines: 3,
                contextMenuBuilder: (context, editableTextState) {
                  return const SizedBox.shrink();
                },
                decoration: InputDecoration(
                  hintText: 'Descripción (opcional)',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _taskController.clear();
                      _descriptionController.clear();
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[400],
                    ),
                    child: const Text('CANCELAR'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () async {
                      if (_taskController.text.isNotEmpty) {
                        await Provider.of<TaskProvider>(context, listen: false)
                            .addTask(
                          _taskController.text,
                          description: _descriptionController.text.isEmpty
                              ? null
                              : _descriptionController.text,
                        );
                        _taskController.clear();
                        _descriptionController.clear();
                        if (mounted) Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('AGREGAR'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'KubaTodo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[600],
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(text: 'ACTIVAS'),
            Tab(text: 'COMPLETADAS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTaskList(false),
          _buildTaskList(true),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildTaskList(bool showCompleted) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        final tasks = showCompleted
            ? taskProvider.completedTasks
            : taskProvider.activeTasks;

        if (tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  showCompleted ? Icons.check_circle_outline : Icons.inbox_outlined,
                  size: 80,
                  color: Colors.grey[800],
                ),
                const SizedBox(height: 16),
                Text(
                  showCompleted
                      ? 'No hay tareas completadas'
                      : 'No hay tareas activas',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          itemBuilder: (context, index) => _buildTaskItem(tasks[index]),
        );
      },
    );
  }

  Widget _buildTaskItem(Task task) {
    return Dismissible(
      key: Key(task.id),
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red[900],
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 32),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<TaskProvider>(context, listen: false).deleteTask(task.id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: task.isCompleted
                ? Colors.grey[800]!
                : Colors.grey[900]!,
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Provider.of<TaskProvider>(context, listen: false)
                  .toggleTask(task.id);
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: task.isCompleted ? Colors.white : Colors.grey[700]!,
                        width: 2,
                      ),
                      color: task.isCompleted ? Colors.white : Colors.transparent,
                    ),
                    child: task.isCompleted
                        ? const Icon(Icons.check, size: 18, color: Colors.black)
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: TextStyle(
                            color: task.isCompleted
                                ? Colors.grey[600]
                                : Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        if (task.description != null &&
                            task.description!.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            task.description!,
                            style: TextStyle(
                              color: task.isCompleted
                                  ? Colors.grey[700]
                                  : Colors.grey[500],
                              fontSize: 14,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
