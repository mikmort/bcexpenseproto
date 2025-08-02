codeunit 50199 "Expense Demo Data Setup"
{
    // Codeunit to create demo data for the Expense Management system
    TableNo = "Integer";

    trigger OnRun()
    begin
        CreateDemoData();
    end;

    local procedure CreateDemoData()
    begin
        ClearExistingData();
        CreateEmployees();
        CreateExpenseGroups();
        CreateExpensePostingGroups();
        CreateExpenseCategories();
        CreateExpenseSubcategories();
        CreateExpenseLocations();
        CreatePaymentMethods();
        CreateExpenseManagementSetup();
        Commit(); // Ensure setup is committed before creating expense reports
        CreateExpensePolicies();
        CreateExpenseReports();
        CreateExpenseReportLines(); // Re-enabled now that it works with auto-generated IDs
        CreateExpenseReceipts();
        CreateExpenseComments(); // Re-enabled with updated report IDs
        CreateExpenseItemizations();
        CreateExpenseItemizationLines();
        CreateExpenseParticipants();
        CreatePerDiemExpenses();

        Message('Demo data creation completed successfully!');
    end;

    local procedure CreateEmployees()
    var
        Employee: Record Employees;
    begin
        // Create sample employees
        if not Employee.Get('EMP001') then begin
            Employee.Init();
            Employee."Employee Id" := 'EMP001';
            Employee."First Name" := 'John';
            Employee."Last Name" := 'Smith';
            Employee.Email := 'john.smith@company.com';
            Employee."Default Currency" := 'USD';
            Employee."Legal Entity" := 'MAIN';
            Employee.Insert();
        end;

        if not Employee.Get('EMP002') then begin
            Employee.Init();
            Employee."Employee Id" := 'EMP002';
            Employee."First Name" := 'Sarah';
            Employee."Last Name" := 'Johnson';
            Employee.Email := 'sarah.johnson@company.com';
            Employee."Default Currency" := 'USD';
            Employee."Legal Entity" := 'MAIN';
            Employee.Insert();
        end;

        if not Employee.Get('EMP003') then begin
            Employee.Init();
            Employee."Employee Id" := 'EMP003';
            Employee."First Name" := 'Michael';
            Employee."Last Name" := 'Brown';
            Employee.Email := 'michael.brown@company.com';
            Employee."Default Currency" := 'EUR';
            Employee."Legal Entity" := 'EU';
            Employee.Insert();
        end;

        if not Employee.Get('EMP004') then begin
            Employee.Init();
            Employee."Employee Id" := 'EMP004';
            Employee."First Name" := 'Emily';
            Employee."Last Name" := 'Davis';
            Employee.Email := 'emily.davis@company.com';
            Employee."Default Currency" := 'USD';
            Employee."Legal Entity" := 'MAIN';
            Employee.Insert();
        end;

        if not Employee.Get('EMP005') then begin
            Employee.Init();
            Employee."Employee Id" := 'EMP005';
            Employee."First Name" := 'David';
            Employee."Last Name" := 'Wilson';
            Employee.Email := 'david.wilson@company.com';
            Employee."Default Currency" := 'GBP';
            Employee."Legal Entity" := 'UK';
            Employee.Insert();
        end;
    end;

    local procedure CreateExpenseGroups()
    var
        ExpenseGroup: Record "Expense Groups";
    begin
        if not ExpenseGroup.Get('TRAVEL') then begin
            ExpenseGroup.Init();
            ExpenseGroup."Expense Group Code" := 'TRAVEL';
            ExpenseGroup.Description := 'Travel Related Expenses';
            ExpenseGroup.Insert();
        end;

        if not ExpenseGroup.Get('OFFICE') then begin
            ExpenseGroup.Init();
            ExpenseGroup."Expense Group Code" := 'OFFICE';
            ExpenseGroup.Description := 'Office Supplies and Equipment';
            ExpenseGroup.Insert();
        end;

        if not ExpenseGroup.Get('MEALS') then begin
            ExpenseGroup.Init();
            ExpenseGroup."Expense Group Code" := 'MEALS';
            ExpenseGroup.Description := 'Meals and Entertainment';
            ExpenseGroup.Insert();
        end;

        if not ExpenseGroup.Get('TRAINING') then begin
            ExpenseGroup.Init();
            ExpenseGroup."Expense Group Code" := 'TRAINING';
            ExpenseGroup.Description := 'Training and Development';
            ExpenseGroup.Insert();
        end;
    end;

    local procedure CreateExpensePostingGroups()
    var
        PostingGroup: Record "Expense Posting Groups";
    begin
        if not PostingGroup.Get('STANDARD') then begin
            PostingGroup.Init();
            PostingGroup."Posting Group Code" := 'STANDARD';
            PostingGroup."Refundable Debit Account" := '6000';
            PostingGroup."Non Refundable Debit Account" := '6100';
            PostingGroup."Prepayment Credit Account" := '2400';
            PostingGroup.Insert();
        end;

        if not PostingGroup.Get('TRAVEL') then begin
            PostingGroup.Init();
            PostingGroup."Posting Group Code" := 'TRAVEL';
            PostingGroup."Refundable Debit Account" := '6200';
            PostingGroup."Non Refundable Debit Account" := '6210';
            PostingGroup."Prepayment Credit Account" := '2410';
            PostingGroup.Insert();
        end;
    end;

    local procedure CreateExpenseCategories()
    var
        Category: Record "Expense Categories";
    begin
        if not Category.Get('AIRFARE') then begin
            Category.Init();
            Category."Category Code" := 'AIRFARE';
            Category.Description := 'Airfare and Flight Tickets';
            Category."Expense Group Code" := 'TRAVEL';
            Category."Posting Group Code" := 'TRAVEL';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('HOTEL') then begin
            Category.Init();
            Category."Category Code" := 'HOTEL';
            Category.Description := 'Hotel Accommodation';
            Category."Expense Group Code" := 'TRAVEL';
            Category."Posting Group Code" := 'TRAVEL';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('MEALS') then begin
            Category.Init();
            Category."Category Code" := 'MEALS';
            Category.Description := 'Business Meals';
            Category."Expense Group Code" := 'MEALS';
            Category."Posting Group Code" := 'STANDARD';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('TAXI') then begin
            Category.Init();
            Category."Category Code" := 'TAXI';
            Category.Description := 'Taxi and Rideshare';
            Category."Expense Group Code" := 'TRAVEL';
            Category."Posting Group Code" := 'TRAVEL';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('OFFICE') then begin
            Category.Init();
            Category."Category Code" := 'OFFICE';
            Category.Description := 'Office Supplies';
            Category."Expense Group Code" := 'OFFICE';
            Category."Posting Group Code" := 'STANDARD';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('TRAINING') then begin
            Category.Init();
            Category."Category Code" := 'TRAINING';
            Category.Description := 'Training and Conferences';
            Category."Expense Group Code" := 'TRAINING';
            Category."Posting Group Code" := 'STANDARD';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;
    end;

    local procedure CreateExpenseSubcategories()
    var
        Subcategory: Record "Expense Subcategories";
    begin
        if not Subcategory.Get('DOMESTIC') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'DOMESTIC';
            Subcategory."Category Code" := 'AIRFARE';
            Subcategory.Description := 'Domestic Flights';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        if not Subcategory.Get('INTL') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'INTL';
            Subcategory."Category Code" := 'AIRFARE';
            Subcategory.Description := 'International Flights';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        if not Subcategory.Get('BREAKFAST') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'BREAKFAST';
            Subcategory."Category Code" := 'MEALS';
            Subcategory.Description := 'Breakfast';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        if not Subcategory.Get('LUNCH') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'LUNCH';
            Subcategory."Category Code" := 'MEALS';
            Subcategory.Description := 'Lunch';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        if not Subcategory.Get('DINNER') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'DINNER';
            Subcategory."Category Code" := 'MEALS';
            Subcategory.Description := 'Dinner';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;
    end;

    local procedure CreateExpenseLocations()
    var
        Location: Record "Expense Locations";
    begin
        if not Location.Get('NYC') then begin
            Location.Init();
            Location."Location Code" := 'NYC';
            Location."Country Region Code" := 'US';
            Location.Description := 'New York City, NY';
            Location.Insert();
        end;

        if not Location.Get('LON') then begin
            Location.Init();
            Location."Location Code" := 'LON';
            Location."Country Region Code" := 'GB';
            Location.Description := 'London, UK';
            Location.Insert();
        end;

        if not Location.Get('PAR') then begin
            Location.Init();
            Location."Location Code" := 'PAR';
            Location."Country Region Code" := 'FR';
            Location.Description := 'Paris, France';
            Location.Insert();
        end;

        if not Location.Get('CHI') then begin
            Location.Init();
            Location."Location Code" := 'CHI';
            Location."Country Region Code" := 'US';
            Location.Description := 'Chicago, IL';
            Location.Insert();
        end;

        if not Location.Get('BER') then begin
            Location.Init();
            Location."Location Code" := 'BER';
            Location."Country Region Code" := 'DE';
            Location.Description := 'Berlin, Germany';
            Location.Insert();
        end;
    end;

    local procedure CreatePaymentMethods()
    var
        PaymentMethod: Record "Payment Methods";
    begin
        if not PaymentMethod.Get('CORP-CARD') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'CORP-CARD';
            PaymentMethod.Description := 'Corporate Credit Card';
            PaymentMethod."Company Paid" := true;
            PaymentMethod.Insert();
        end;

        if not PaymentMethod.Get('PERSONAL') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'PERSONAL';
            PaymentMethod.Description := 'Personal Payment (Reimbursable)';
            PaymentMethod."Company Paid" := false;
            PaymentMethod.Insert();
        end;

        if not PaymentMethod.Get('CASH') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'CASH';
            PaymentMethod.Description := 'Cash Payment';
            PaymentMethod."Company Paid" := false;
            PaymentMethod.Insert();
        end;

        if not PaymentMethod.Get('CHECK') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'CHECK';
            PaymentMethod.Description := 'Company Check';
            PaymentMethod."Company Paid" := true;
            PaymentMethod.Insert();
        end;
    end;

    local procedure CreateExpenseManagementSetup()
    var
        Setup: Record "Expense Management Setup";
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        // Create number series for expense reports
        if not NoSeries.Get('EXP-REPORT') then begin
            NoSeries.Init();
            NoSeries.Code := 'EXP-REPORT';
            NoSeries.Description := 'Expense Reports';
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := true;
            NoSeries.Insert();

            // Create number series line
            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := 'EXP-REPORT';
            NoSeriesLine."Line No." := 10000;
            NoSeriesLine."Starting Date" := Today();
            NoSeriesLine."Starting No." := 'EXP-001';
            NoSeriesLine."Ending No." := 'EXP-999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Insert();
        end;

        // Create number series for posted expense reports
        if not NoSeries.Get('POSTED-EXP') then begin
            NoSeries.Init();
            NoSeries.Code := 'POSTED-EXP';
            NoSeries.Description := 'Posted Expense Reports';
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := false;
            NoSeries.Insert();

            // Create number series line
            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := 'POSTED-EXP';
            NoSeriesLine."Line No." := 10000;
            NoSeriesLine."Starting Date" := Today();
            NoSeriesLine."Starting No." := 'PEXP-001';
            NoSeriesLine."Ending No." := 'PEXP-999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Insert();
        end;

        // Create or update setup record
        if not Setup.Get(1) then begin
            Setup.Init();
            Setup."Setup Id" := 1;
            Setup."Expense Report No. Sequence" := 'EXP-REPORT';
            Setup."Posted Expense Report No Seq." := 'POSTED-EXP';
            Setup."Enable Expense Agent" := true;
            Setup.Insert();
        end else begin
            Setup."Expense Report No. Sequence" := 'EXP-REPORT';
            Setup."Posted Expense Report No Seq." := 'POSTED-EXP';
            Setup.Modify();
        end;
    end;

    local procedure CreateExpensePolicies()
    var
        Policy: Record "Expense Policies";
    begin
        if not Policy.Get(1) then begin
            Policy.Init();
            Policy."Policy Id" := 1;
            Policy."Expense Category Code" := 'MEALS';
            Policy."Expense Location Code" := 'NYC';
            Policy."Condition Expression" := 'Daily meal allowance';
            Policy."Receipt Required" := false;
            Policy."Daily Limit Amount" := 75.00;
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;

        if not Policy.Get(2) then begin
            Policy.Init();
            Policy."Policy Id" := 2;
            Policy."Expense Category Code" := 'HOTEL';
            Policy."Expense Location Code" := 'LON';
            Policy."Condition Expression" := 'International hotel stays';
            Policy."Receipt Required" := true;
            Policy."Daily Limit Amount" := 300.00;
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;

        if not Policy.Get(3) then begin
            Policy.Init();
            Policy."Policy Id" := 3;
            Policy."Expense Category Code" := 'TAXI';
            Policy."Expense Location Code" := 'NYC';
            Policy."Condition Expression" := 'Per trip taxi limit';
            Policy."Receipt Required" := true;
            Policy."Daily Limit Amount" := 50.00;
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;
    end;

    local procedure CreateExpenseReports()
    var
        Report: Record "Expense Reports";
        ReportId1, ReportId2, ReportId3, ReportId4 : Code[30];
    begin
        // Create first expense report - let number series generate ID
        Report.Init();
        Report."Employee Id" := 'EMP001';
        Report.Purpose := 'Client Meeting in New York';
        Report.Destination := 'New York, NY';
        Report."Report Date" := Today() - 30;
        Report."Posting Date" := Today() - 25;
        Report."Currency Code" := 'USD';
        Report."Total Amount" := 1250.00;
        Report.Status := 'Submitted';
        Report."Payment Method Code" := 'PERSONAL';
        Report."Receipts Attached" := true;
        Report."Created By" := UserId();
        Report."Created Date Time" := CurrentDateTime() - 720000; // 30 days ago
        Report.Insert(true);
        ReportId1 := Report."Report Id";

        // Create second expense report
        Report.Init();
        Report."Employee Id" := 'EMP002';
        Report.Purpose := 'Training Conference in Chicago';
        Report.Destination := 'Chicago, IL';
        Report."Report Date" := Today() - 20;
        Report."Posting Date" := Today() - 15;
        Report."Currency Code" := 'USD';
        Report."Total Amount" := 980.50;
        Report.Status := 'Approved';
        Report."Payment Method Code" := 'CORP-CARD';
        Report."Receipts Attached" := true;
        Report."Created By" := UserId();
        Report."Created Date Time" := CurrentDateTime() - 480000; // 20 days ago
        Report.Insert(true);
        ReportId2 := Report."Report Id";

        // Create third expense report
        Report.Init();
        Report."Employee Id" := 'EMP003';
        Report.Purpose := 'European Sales Meeting';
        Report.Destination := 'London, UK';
        Report."Report Date" := Today() - 10;
        Report."Posting Date" := Today() - 5;
        Report."Currency Code" := 'GBP';
        Report."Total Amount" := 875.25;
        Report.Status := 'Draft';
        Report."Payment Method Code" := 'PERSONAL';
        Report."Receipts Attached" := false;
        Report."Created By" := UserId();
        Report."Created Date Time" := CurrentDateTime() - 240000; // 10 days ago
        Report.Insert(true);
        ReportId3 := Report."Report Id";

        // Create fourth expense report
        Report.Init();
        Report."Employee Id" := 'EMP004';
        Report.Purpose := 'Office Supplies Purchase';
        Report.Destination := 'Local Office';
        Report."Report Date" := Today() - 5;
        Report."Posting Date" := Today();
        Report."Currency Code" := 'USD';
        Report."Total Amount" := 125.75;
        Report.Status := 'Submitted';
        Report."Payment Method Code" := 'CASH';
        Report."Receipts Attached" := true;
        Report."Created By" := UserId();
        Report."Created Date Time" := CurrentDateTime() - 120000; // 5 days ago
        Report.Insert(true);
        ReportId4 := Report."Report Id";

        // Store the generated IDs for use in creating expense lines
        SetDemoReportIds(ReportId1, ReportId2, ReportId3, ReportId4);
    end;

    var
        DemoReportId1, DemoReportId2, DemoReportId3, DemoReportId4 : Code[30];

    local procedure SetDemoReportIds(ReportId1: Code[30]; ReportId2: Code[30]; ReportId3: Code[30]; ReportId4: Code[30])
    begin
        DemoReportId1 := ReportId1;
        DemoReportId2 := ReportId2;
        DemoReportId3 := ReportId3;
        DemoReportId4 := ReportId4;
    end;

    local procedure GetDemoReportId(ReportNumber: Integer): Code[30]
    begin
        case ReportNumber of
            1:
                exit(DemoReportId1);
            2:
                exit(DemoReportId2);
            3:
                exit(DemoReportId3);
            4:
                exit(DemoReportId4);
        end;
    end;

    local procedure CreateExpenseReportLines()
    var
        Line: Record "Expense Report Lines";
        LineId: Integer;
    begin
        LineId := 1;

        // Lines for first report
        Line.Init();
        Line."Line Id" := LineId;
        Line."Report Id" := GetDemoReportId(1);
        Line."Line Number" := 10000;
        Line."Expense Date" := Today() - 30;
        Line."Category Code" := 'AIRFARE';
        Line."Subcategory Code" := 'DOMESTIC';
        Line."Currency Code" := 'USD';
        Line.Amount := 450.00;
        Line."Tax Amount" := 0.00;
        Line."Reimbursable Amount" := 450.00;
        Line."Expense Location Code" := 'NYC';
        Line."Payment Method Code" := 'PERSONAL';
        Line."Receipt Required" := true;
        Line.Description := 'Flight to New York for client meeting';
        Line.Status := 'Approved';
        Line.Insert();

        LineId += 1;
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := GetDemoReportId(1);
            Line."Line Number" := 20000;
            Line."Expense Date" := Today() - 29;
            Line."Category Code" := 'HOTEL';
            Line."Currency Code" := 'USD';
            Line.Amount := 320.00;
            Line."Tax Amount" := 25.60;
            Line."Reimbursable Amount" := 320.00;
            Line."Expense Location Code" := 'NYC';
            Line."Payment Method Code" := 'PERSONAL';
            Line."Receipt Required" := true;
            Line.Description := 'Hotel accommodation - 2 nights';
            Line.Status := 'Approved';
            Line.Insert();
        end;

        LineId += 1;
        Line.Init();
        Line."Line Id" := LineId;
        Line."Report Id" := GetDemoReportId(1);
        Line."Line Number" := 30000;
        Line."Expense Date" := Today() - 29;
        Line."Category Code" := 'MEALS';
        Line."Subcategory Code" := 'DINNER';
        Line."Currency Code" := 'USD';
        Line.Amount := 85.00;
        Line."Tax Amount" := 6.80;
        Line."Reimbursable Amount" := 85.00;
        Line."Expense Location Code" := 'NYC';
        Line."Payment Method Code" := 'PERSONAL';
        Line."Receipt Required" := true;
        Line.Description := 'Business dinner with client';
        Line.Status := 'Approved';
        Line.Insert();

        // Lines for second report
        LineId += 1;
        Line.Init();
        Line."Line Id" := LineId;
        Line."Report Id" := GetDemoReportId(2);
        Line."Line Number" := 10000;
        Line."Expense Date" := Today() - 20;
        Line."Category Code" := 'TRAINING';
        Line."Currency Code" := 'USD';
        Line.Amount := 650.00;
        Line."Tax Amount" := 0.00;
        Line."Reimbursable Amount" := 650.00;
        Line."Expense Location Code" := 'CHI';
        Line."Payment Method Code" := 'CORP-CARD';
        Line."Receipt Required" := true;
        Line.Description := 'Conference registration fee';
        Line.Status := 'Approved';
        Line.Insert();

        LineId += 1;
        Line.Init();
        Line."Line Id" := LineId;
        Line."Report Id" := GetDemoReportId(2);
        Line."Line Number" := 20000;
        Line."Expense Date" := Today() - 19;
        Line."Category Code" := 'TAXI';
        Line."Currency Code" := 'USD';
        Line.Amount := 35.50;
        Line."Tax Amount" := 2.84;
        Line."Reimbursable Amount" := 35.50;
        Line."Expense Location Code" := 'CHI';
        Line."Payment Method Code" := 'CORP-CARD';
        Line."Receipt Required" := true;
        Line.Description := 'Airport taxi';
        Line.Status := 'Approved';
        Line.Insert();

        // Lines for fourth report
        LineId += 1;
        Line.Init();
        Line."Line Id" := LineId;
        Line."Report Id" := GetDemoReportId(4);
        Line."Line Number" := 10000;
        Line."Expense Date" := Today() - 5;
        Line."Category Code" := 'OFFICE';
        Line."Currency Code" := 'USD';
        Line.Amount := 125.75;
        Line."Tax Amount" := 10.06;
        Line."Reimbursable Amount" := 125.75;
        Line."Payment Method Code" := 'CASH';
        Line."Receipt Required" := true;
        Line.Description := 'Printer paper and office supplies';
        Line.Status := 'Submitted';
        Line.Insert();
    end;

    local procedure CreateExpenseReceipts()
    var
        Receipt: Record "Expense Receipts";
        ReceiptId: Integer;
    begin
        ReceiptId := 1;

        if not Receipt.Get(ReceiptId) then begin
            Receipt.Init();
            Receipt."Receipt Id" := ReceiptId;
            Receipt."Line Id" := 1; // Airfare receipt
            Receipt."File Name" := 'airline_receipt_001.pdf';
            Receipt."File Uri" := 'https://receipts.company.com/001.pdf';
            Receipt."Uploaded Date Time" := CurrentDateTime() - 700000;
            Receipt."Amount On Receipt" := 450.00;
            Receipt."Currency Code" := 'USD';
            Receipt.Insert();
        end;

        ReceiptId += 1;
        if not Receipt.Get(ReceiptId) then begin
            Receipt.Init();
            Receipt."Receipt Id" := ReceiptId;
            Receipt."Line Id" := 2; // Hotel receipt
            Receipt."File Name" := 'hotel_receipt_002.pdf';
            Receipt."File Uri" := 'https://receipts.company.com/002.pdf';
            Receipt."Uploaded Date Time" := CurrentDateTime() - 690000;
            Receipt."Amount On Receipt" := 320.00;
            Receipt."Currency Code" := 'USD';
            Receipt.Insert();
        end;

        ReceiptId += 1;
        if not Receipt.Get(ReceiptId) then begin
            Receipt.Init();
            Receipt."Receipt Id" := ReceiptId;
            Receipt."Line Id" := 6; // Office supplies receipt
            Receipt."File Name" := 'office_supplies_003.jpg';
            Receipt."File Uri" := 'https://receipts.company.com/003.jpg';
            Receipt."Uploaded Date Time" := CurrentDateTime() - 100000;
            Receipt."Amount On Receipt" := 125.75;
            Receipt."Currency Code" := 'USD';
            Receipt.Insert();
        end;
    end;

    local procedure CreateExpenseComments()
    var
        Comment: Record "Expense Comments";
        CommentId: Integer;
    begin
        CommentId := 1;

        if not Comment.Get(CommentId) then begin
            Comment.Init();
            Comment."Comment Id" := CommentId;
            Comment."Report Id" := GetDemoReportId(1);
            Comment."Line Id" := 1;
            Comment."Comment Text" := 'Flight was delayed, but still made it to the meeting on time.';
            Comment."Comment Date Time" := CurrentDateTime() - 600000;
            Comment."Created By" := 'EMP001';
            Comment.Insert();
        end;

        CommentId += 1;
        if not Comment.Get(CommentId) then begin
            Comment.Init();
            Comment."Comment Id" := CommentId;
            Comment."Report Id" := GetDemoReportId(2);
            Comment."Comment Text" := 'Conference was very valuable for our team development.';
            Comment."Comment Date Time" := CurrentDateTime() - 400000;
            Comment."Created By" := 'EMP002';
            Comment.Insert();
        end;

        CommentId += 1;
        if not Comment.Get(CommentId) then begin
            Comment.Init();
            Comment."Comment Id" := CommentId;
            Comment."Report Id" := GetDemoReportId(4);
            Comment."Comment Text" := 'Urgently needed supplies for quarterly reports.';
            Comment."Comment Date Time" := CurrentDateTime() - 100000;
            Comment."Created By" := 'EMP004';
            Comment.Insert();
        end;
    end;

    local procedure CreateExpenseItemizations()
    var
        Itemization: Record "Expense Itemizations";
        ItemizationId: Integer;
    begin
        ItemizationId := 1;

        if not Itemization.Get(ItemizationId) then begin
            Itemization.Init();
            Itemization."Itemization Id" := ItemizationId;
            Itemization."Line Id" := 3; // Business dinner
            Itemization."Total Amount" := 85.00;
            Itemization."Total Reimbursable Amount" := 85.00;
            Itemization.Insert();
        end;
    end;

    local procedure CreateExpenseItemizationLines()
    var
        ItemLine: Record "Expense Itemization Lines";
        ItemLineId: Integer;
    begin
        ItemLineId := 1;

        if not ItemLine.Get(ItemLineId) then begin
            ItemLine.Init();
            ItemLine."Itemization Line Id" := ItemLineId;
            ItemLine."Itemization Id" := 1;
            ItemLine."Start Date" := Today() - 29;
            ItemLine."End Date" := Today() - 29;
            ItemLine.Amount := 65.00;
            ItemLine.Description := 'Main course and beverages';
            ItemLine."Expense Location Code" := 'NYC';
            ItemLine.Insert();
        end;

        ItemLineId += 1;
        if not ItemLine.Get(ItemLineId) then begin
            ItemLine.Init();
            ItemLine."Itemization Line Id" := ItemLineId;
            ItemLine."Itemization Id" := 1;
            ItemLine."Start Date" := Today() - 29;
            ItemLine."End Date" := Today() - 29;
            ItemLine.Amount := 20.00;
            ItemLine.Description := 'Tip';
            ItemLine."Expense Location Code" := 'NYC';
            ItemLine.Insert();
        end;
    end;

    local procedure CreateExpenseParticipants()
    var
        Participant: Record "Expense Participants";
        ParticipantId: Integer;
    begin
        ParticipantId := 1;

        if not Participant.Get(ParticipantId) then begin
            Participant.Init();
            Participant."Participant Id" := ParticipantId;
            Participant."Line Id" := 3; // Business dinner
            Participant."Participant Name" := 'Client Representative';
            Participant."Participant Type" := 'External';
            Participant.Insert();
        end;

        ParticipantId += 1;
        if not Participant.Get(ParticipantId) then begin
            Participant.Init();
            Participant."Participant Id" := ParticipantId;
            Participant."Line Id" := 3;
            Participant."Participant Name" := 'John Smith';
            Participant."Participant Type" := 'Employee';
            Participant.Insert();
        end;
    end;

    local procedure CreatePerDiemExpenses()
    var
        PerDiem: Record "Per Diem Expenses";
        PerDiemId: Integer;
    begin
        PerDiemId := 1;

        if not PerDiem.Get(PerDiemId) then begin
            PerDiem.Init();
            PerDiem."Per Diem Id" := PerDiemId;
            PerDiem."Line Id" := 3; // Meals line
            PerDiem."Employee Id" := 'EMP001';
            PerDiem."Expense Date" := Today() - 29;
            PerDiem."Expense Location Code" := 'NYC';
            PerDiem."Daily Rate" := 75.00;
            PerDiem."Itemized Amount" := 85.00;
            PerDiem.Insert();
        end;

        PerDiemId += 1;
        if not PerDiem.Get(PerDiemId) then begin
            PerDiem.Init();
            PerDiem."Per Diem Id" := PerDiemId;
            PerDiem."Employee Id" := 'EMP002';
            PerDiem."Expense Date" := Today() - 19;
            PerDiem."Expense Location Code" := 'CHI';
            PerDiem."Daily Rate" := 70.00;
            PerDiem."Itemized Amount" := 0.00;
            PerDiem.Insert();
        end;
    end;

    local procedure ClearExistingData()
    var
        ExpenseReport: Record "Expense Reports";
        ExpenseReportLine: Record "Expense Report Lines";
        ExpenseReceipt: Record "Expense Receipts";
        ExpenseComment: Record "Expense Comments";
        ExpenseItemization: Record "Expense Itemizations";
        ExpenseItemizationLine: Record "Expense Itemization Lines";
        ExpenseParticipant: Record "Expense Participants";
        PerDiemExpense: Record "Per Diem Expenses";
    begin
        // Clear all demo data in reverse dependency order
        PerDiemExpense.DeleteAll();
        ExpenseParticipant.DeleteAll();
        ExpenseItemizationLine.DeleteAll();
        ExpenseItemization.DeleteAll();
        ExpenseComment.DeleteAll();
        ExpenseReceipt.DeleteAll();
        ExpenseReportLine.DeleteAll();
        ExpenseReport.DeleteAll();
    end;
}
