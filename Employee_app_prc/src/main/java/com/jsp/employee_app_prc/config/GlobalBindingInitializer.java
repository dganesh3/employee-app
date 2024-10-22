package com.jsp.employee_app_prc.config;

import java.beans.PropertyEditorSupport;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class GlobalBindingInitializer {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, "dob", new CustomLocalDateEditor());
    }
}

class CustomLocalDateEditor extends PropertyEditorSupport {
    private final DateTimeFormatter formatter;

    public CustomLocalDateEditor() {
        // Define the date format here
        this.formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        // Handle empty strings
        if (text == null || text.isEmpty()) {
            setValue(null);
        } else {
            // Convert the string to LocalDate
            setValue(LocalDate.parse(text, formatter));
        }
    }
}