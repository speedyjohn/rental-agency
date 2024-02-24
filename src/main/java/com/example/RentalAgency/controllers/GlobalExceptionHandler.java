package com.example.RentalAgency.controllers;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public String handleGeneralError(Exception e, Model model) {
        model.addAttribute("errorTitle", "Unexpected error");
        model.addAttribute("errorMessage", e.getMessage());
        return "exceptions/error";
    }
}
