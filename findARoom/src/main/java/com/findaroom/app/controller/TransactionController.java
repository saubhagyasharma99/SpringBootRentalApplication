package com.findaroom.app.controller;


import com.findaroom.app.model.TransactionRequestDTO;
import com.findaroom.app.service.TransactionProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/api/transaction")
public class TransactionController {

    private final TransactionProcessor transactionProcessor;

    @Autowired
    public TransactionController(TransactionProcessor transactionProcessor) {
        this.transactionProcessor = transactionProcessor;
    }

    @PostMapping("/process")
    public String processTransaction(@ModelAttribute("transactionRequest") TransactionRequestDTO transactionRequest, Model model) {
        TransactionRequestDTO transactionResponse = transactionProcessor.getTransactionRequest(transactionRequest);
        model.addAttribute("transactionRequest", transactionResponse);
        return "transaction";
    }

    @GetMapping({"/", "home"})
    public String getHomePath(Model model) {
        model.addAttribute("transactionRequest", new TransactionRequestDTO());
        return "indexT";
    }

    @GetMapping("/transactionSuccess")
    public String transactionSuccess(Model model, @RequestParam("TXNID") String transactionId) {
        model.addAttribute("TXNID", transactionId);
        return "transactionSuccess";
    }
}

