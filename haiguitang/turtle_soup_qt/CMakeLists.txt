cmake_minimum_required(VERSION 3.16)

project(turtle_soup VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appturtle_soup
    main.cpp
)

qt_add_qml_module(appturtle_soup
    URI turtle_soup
    VERSION 1.0
    QML_FILES

    RESOURCES
    QML_FILES Main.qml
    QML_FILES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appturtle_soup PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appturtle_soup
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appturtle_soup
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appturtle_soup
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
