package ua.goit.controller;


import lombok.SneakyThrows;
import ua.goit.service.commands.Command;
import ua.goit.view.View;

import java.util.Map;
import java.util.Optional;

public class ConsoleController {

    private View view;
    private final Map<String, Command> commands;

    @SneakyThrows
    public ConsoleController(View view) {
        this.view = view;
        this.commands = Command.of(view);
    }

    public void process() {
        view.write("Hello World");
        while (true) {
            view.write("`help` for a list of available commands.");
            Optional.ofNullable(commands.get(view.read())).ifPresent(Command::process);
        }
    }

}
