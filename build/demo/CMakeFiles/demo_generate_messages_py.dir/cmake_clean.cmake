FILE(REMOVE_RECURSE
  "CMakeFiles/demo_generate_messages_py"
  "/home/vcoder/ros_ws/devel/lib/python2.7/dist-packages/demo/msg/_Num.py"
  "/home/vcoder/ros_ws/devel/lib/python2.7/dist-packages/demo/srv/_find_Me.py"
  "/home/vcoder/ros_ws/devel/lib/python2.7/dist-packages/demo/srv/_AddTwoInts.py"
  "/home/vcoder/ros_ws/devel/lib/python2.7/dist-packages/demo/msg/__init__.py"
  "/home/vcoder/ros_ws/devel/lib/python2.7/dist-packages/demo/srv/__init__.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/demo_generate_messages_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
