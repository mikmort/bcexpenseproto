codeunit 50197 "Expense Setup Data"
{
    // Codeunit to create realistic setup data for the Expense Management system
    // This data represents good defaults that would make sense for any US customer
    TableNo = "Integer";

    trigger OnRun()
    begin
        CreateSetupData();
    end;

    local procedure CreateSetupData()
    begin
        CreateExpenseGroups();
        CreateExpensePostingGroups(); // Re-enabled for master data creation
        CreateExpenseCategories();
        CreateExpenseSubcategories();
        CreateExpenseLocations();
        CreatePaymentMethods();
        CreateNumberSeries();
        CreateExpenseManagementSetup();
        CreateExpensePolicies();

        Message('Setup data creation completed successfully!');
    end;

    local procedure CreateExpenseGroups()
    var
        ExpenseGroup: Record "Expense Groups";
    begin
        // Create realistic expense groups that most US companies would use
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

        if not ExpenseGroup.Get('TELECOM') then begin
            ExpenseGroup.Init();
            ExpenseGroup."Expense Group Code" := 'TELECOM';
            ExpenseGroup.Description := 'Telecommunications';
            ExpenseGroup.Insert();
        end;

        if not ExpenseGroup.Get('VEHICLE') then begin
            ExpenseGroup.Init();
            ExpenseGroup."Expense Group Code" := 'VEHICLE';
            ExpenseGroup.Description := 'Vehicle and Transportation';
            ExpenseGroup.Insert();
        end;
    end;

    local procedure CreateExpensePostingGroups()
    var
        PostingGroup: Record "Expense Posting Groups";
        GLAccount: Record "G/L Account";
        CreatedCount: Integer;
    begin
        CreatedCount := 0;

        // Comprehensive posting groups for US businesses
        if CreatePostingGroupIfAccountsExist('TRAVEL', 'Air/Rail/Bus tickets, lodging, taxi, mileage, parking, per diem', '15910', '62310', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('VEHICLE', 'Fuel, tolls, car service, leasing fees charged back to employee', '15910', '62110', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('ENTERTAIN_DED', 'Client meals & entertainment – deductible portion', '15910', '63420', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('ENTERTAIN_NDED', 'Client meals & entertainment – non-deductible portion', '15910', '63430', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('FREIGHT', 'Small-parcel or courier fees paid out-of-pocket', '15910', '62210', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('OFFICE_SUP', 'Stationery, printer ink, small peripherals, < DKK 2 500 tech', '15910', '64100', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('TELECOM_IT', 'Mobile data, hotspot day-passes, SIM cards', '15910', '64200', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('SOFTWARE_SUB', 'SaaS subscriptions, short-term licences bought on a card', '15910', '64600', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('MARKETING', 'Ads, event sponsorships, promo materials picked up locally', '15910', '63100', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('PRO_SERV', 'One-off consulting, design, legal, accounting fees', '15910', '68110', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('LICENSES_ROY', 'Digital-content licences, royalties paid ad-hoc', '15910', '68210', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('INSURANCE_MISC', 'Travel insurance, baggage insurance, ad-hoc risk fees', '15910', '65100', '25200') then
            CreatedCount += 1;

        if CreatePostingGroupIfAccountsExist('MISC_OTHER', 'Miscellaneous expenses that don''t fit other categories (review monthly)', '15910', '67400', '25200') then
            CreatedCount += 1;
    end;

    local procedure CreateExpenseCategories()
    var
        Category: Record "Expense Categories";
    begin
        // Comprehensive list of expense categories for US businesses

        // Travel categories
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

        if not Category.Get('RENTAL-CAR') then begin
            Category.Init();
            Category."Category Code" := 'RENTAL-CAR';
            Category.Description := 'Car Rental';
            Category."Expense Group Code" := 'TRAVEL';
            Category."Posting Group Code" := 'VEHICLE';
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

        if not Category.Get('PARKING') then begin
            Category.Init();
            Category."Category Code" := 'PARKING';
            Category.Description := 'Parking Fees';
            Category."Expense Group Code" := 'TRAVEL';
            Category."Posting Group Code" := 'TRAVEL';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        // Meals and Entertainment
        if not Category.Get('MEALS') then begin
            Category.Init();
            Category."Category Code" := 'MEALS';
            Category.Description := 'Business Meals';
            Category."Expense Group Code" := 'MEALS';
            Category."Posting Group Code" := 'ENTERTAIN_DED';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('ENTERTAINMENT') then begin
            Category.Init();
            Category."Category Code" := 'ENTERTAINMENT';
            Category.Description := 'Client Entertainment';
            Category."Expense Group Code" := 'MEALS';
            Category."Posting Group Code" := 'ENTERTAIN_DED';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        // Office and Supplies
        if not Category.Get('OFFICE-SUPPLY') then begin
            Category.Init();
            Category."Category Code" := 'OFFICE-SUPPLY';
            Category.Description := 'Office Supplies';
            Category."Expense Group Code" := 'OFFICE';
            Category."Posting Group Code" := 'OFFICE_SUP';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('SOFTWARE') then begin
            Category.Init();
            Category."Category Code" := 'SOFTWARE';
            Category.Description := 'Software and Subscriptions';
            Category."Expense Group Code" := 'OFFICE';
            Category."Posting Group Code" := 'SOFTWARE_SUB';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('POSTAGE') then begin
            Category.Init();
            Category."Category Code" := 'POSTAGE';
            Category.Description := 'Postage and Shipping';
            Category."Expense Group Code" := 'OFFICE';
            Category."Posting Group Code" := 'FREIGHT';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        // Training and Professional Development
        if not Category.Get('TRAINING') then begin
            Category.Init();
            Category."Category Code" := 'TRAINING';
            Category.Description := 'Training and Conferences';
            Category."Expense Group Code" := 'TRAINING';
            Category."Posting Group Code" := 'PRO_SERV';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('BOOKS') then begin
            Category.Init();
            Category."Category Code" := 'BOOKS';
            Category.Description := 'Books and Publications';
            Category."Expense Group Code" := 'TRAINING';
            Category."Posting Group Code" := 'LICENSES_ROY';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('MEMBERSHIP') then begin
            Category.Init();
            Category."Category Code" := 'MEMBERSHIP';
            Category.Description := 'Professional Memberships';
            Category."Expense Group Code" := 'TRAINING';
            Category."Posting Group Code" := 'PRO_SERV';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        // Telecommunications
        if not Category.Get('PHONE') then begin
            Category.Init();
            Category."Category Code" := 'PHONE';
            Category.Description := 'Phone and Mobile';
            Category."Expense Group Code" := 'TELECOM';
            Category."Posting Group Code" := 'TELECOM_IT';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('INTERNET') then begin
            Category.Init();
            Category."Category Code" := 'INTERNET';
            Category.Description := 'Internet and Data';
            Category."Expense Group Code" := 'TELECOM';
            Category."Posting Group Code" := 'TELECOM_IT';
            Category.Refundable := false;
            Category.Active := true;
            Category.Insert();
        end;

        // Vehicle and Mileage
        if not Category.Get('MILEAGE') then begin
            Category.Init();
            Category."Category Code" := 'MILEAGE';
            Category.Description := 'Vehicle Mileage';
            Category."Expense Group Code" := 'VEHICLE';
            Category."Posting Group Code" := 'VEHICLE';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('GAS') then begin
            Category.Init();
            Category."Category Code" := 'GAS';
            Category.Description := 'Fuel and Gas';
            Category."Expense Group Code" := 'VEHICLE';
            Category."Posting Group Code" := 'VEHICLE';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;

        if not Category.Get('TOLLS') then begin
            Category.Init();
            Category."Category Code" := 'TOLLS';
            Category.Description := 'Tolls and Bridge Fees';
            Category."Expense Group Code" := 'VEHICLE';
            Category."Posting Group Code" := 'VEHICLE';
            Category.Refundable := true;
            Category.Active := true;
            Category.Insert();
        end;
    end;

    local procedure CreateExpenseSubcategories()
    var
        Subcategory: Record "Expense Subcategories";
    begin
        // Airfare subcategories
        if not Subcategory.Get('DOMESTIC') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'DOMESTIC';
            Subcategory."Category Code" := 'AIRFARE';
            Subcategory.Description := 'Domestic Flights';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        if not Subcategory.Get('INTERNATIONAL') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'INTERNATIONAL';
            Subcategory."Category Code" := 'AIRFARE';
            Subcategory.Description := 'International Flights';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        // Meals subcategories
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

        // Training subcategories
        if not Subcategory.Get('CONFERENCE') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'CONFERENCE';
            Subcategory."Category Code" := 'TRAINING';
            Subcategory.Description := 'Conference Registration';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        if not Subcategory.Get('CERTIFICATION') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'CERTIFICATION';
            Subcategory."Category Code" := 'TRAINING';
            Subcategory.Description := 'Professional Certification';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;

        if not Subcategory.Get('WORKSHOP') then begin
            Subcategory.Init();
            Subcategory."Subcategory Code" := 'WORKSHOP';
            Subcategory."Category Code" := 'TRAINING';
            Subcategory.Description := 'Workshop or Seminar';
            Subcategory.Refundable := true;
            Subcategory.Active := true;
            Subcategory.Insert();
        end;
    end;

    local procedure CreateExpenseLocations()
    var
        Location: Record "Expense Locations";
    begin
        // Major US business locations
        if not Location.Get('NYC') then begin
            Location.Init();
            Location."Location Code" := 'NYC';
            Location.Description := 'New York City, NY';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('CHI') then begin
            Location.Init();
            Location."Location Code" := 'CHI';
            Location.Description := 'Chicago, IL';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('LAX') then begin
            Location.Init();
            Location."Location Code" := 'LAX';
            Location.Description := 'Los Angeles, CA';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('ATL') then begin
            Location.Init();
            Location."Location Code" := 'ATL';
            Location.Description := 'Atlanta, GA';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('SEA') then begin
            Location.Init();
            Location."Location Code" := 'SEA';
            Location.Description := 'Seattle, WA';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('DFW') then begin
            Location.Init();
            Location."Location Code" := 'DFW';
            Location.Description := 'Dallas, TX';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('BOS') then begin
            Location.Init();
            Location."Location Code" := 'BOS';
            Location.Description := 'Boston, MA';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('MIA') then begin
            Location.Init();
            Location."Location Code" := 'MIA';
            Location.Description := 'Miami, FL';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('DEN') then begin
            Location.Init();
            Location."Location Code" := 'DEN';
            Location.Description := 'Denver, CO';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        if not Location.Get('LAS') then begin
            Location.Init();
            Location."Location Code" := 'LAS';
            Location.Description := 'Las Vegas, NV';
            Location."Country Region Code" := 'US';

            Location.Insert();
        end;

        // Common international locations
        if not Location.Get('LON') then begin
            Location.Init();
            Location."Location Code" := 'LON';
            Location.Description := 'London, UK';
            Location."Country Region Code" := 'GB';

            Location.Insert();
        end;

        if not Location.Get('TOR') then begin
            Location.Init();
            Location."Location Code" := 'TOR';
            Location.Description := 'Toronto, Canada';
            Location."Country Region Code" := 'CA';

            Location.Insert();
        end;
    end;

    local procedure CreatePaymentMethods()
    var
        PaymentMethod: Record "Payment Methods";
    begin
        // Standard payment methods for US businesses
        if not PaymentMethod.Get('PERSONAL') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'PERSONAL';
            PaymentMethod.Description := 'Personal Payment (Reimbursable)';
            PaymentMethod."Company Paid" := false;
            PaymentMethod.Insert();
        end;

        if not PaymentMethod.Get('CORP-CARD') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'CORP-CARD';
            PaymentMethod.Description := 'Corporate Credit Card';
            PaymentMethod."Company Paid" := true;
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

        if not PaymentMethod.Get('DEBIT-CARD') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'DEBIT-CARD';
            PaymentMethod.Description := 'Corporate Debit Card';
            PaymentMethod."Company Paid" := true;
            PaymentMethod.Insert();
        end;

        if not PaymentMethod.Get('PETTY-CASH') then begin
            PaymentMethod.Init();
            PaymentMethod."Payment Method Code" := 'PETTY-CASH';
            PaymentMethod.Description := 'Petty Cash';
            PaymentMethod."Company Paid" := true;
            PaymentMethod.Insert();
        end;
    end;

    local procedure CreateExpenseManagementSetup()
    var
        Setup: Record "Expense Management Setup";
    begin
        if not Setup.Get(1) then begin
            Setup.Init();
            Setup."Setup Id" := 1;
            Setup."Expense Report No. Sequence" := 'EXP-REPORT';
            Setup."Posted Expense Report No Seq." := 'POSTED-EXP';
            Setup."Enable Expense Agent" := true;
            Setup.Insert();
        end;
    end;

    local procedure CreateExpensePolicies()
    var
        Policy: Record "Expense Policies";
    begin
        // Common US business expense policies

        // Daily meal allowance policy
        if not Policy.Get(1) then begin
            Policy.Init();
            Policy."Policy Id" := 1;
            Policy."Expense Category Code" := 'MEALS';
            Policy."Expense Location Code" := '';  // Applies to all locations
            Policy."Condition Expression" := 'Daily meal allowance for domestic travel';
            Policy."Receipt Required" := false;
            Policy."Daily Limit Amount" := 60.00;  // Standard GSA rate
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;

        // High-cost city meal allowance
        if not Policy.Get(2) then begin
            Policy.Init();
            Policy."Policy Id" := 2;
            Policy."Expense Category Code" := 'MEALS';
            Policy."Expense Location Code" := 'NYC';
            Policy."Condition Expression" := 'Daily meal allowance for high-cost cities';
            Policy."Receipt Required" := false;
            Policy."Daily Limit Amount" := 85.00;
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;

        // Hotel receipt requirement
        if not Policy.Get(3) then begin
            Policy.Init();
            Policy."Policy Id" := 3;
            Policy."Expense Category Code" := 'HOTEL';
            Policy."Expense Location Code" := '';  // Applies to all locations
            Policy."Condition Expression" := 'Hotel stays require receipts regardless of amount';
            Policy."Receipt Required" := true;
            Policy."Daily Limit Amount" := 0.00;  // No limit, but receipt required
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;

        // Airfare advance approval policy
        if not Policy.Get(4) then begin
            Policy.Init();
            Policy."Policy Id" := 4;
            Policy."Expense Category Code" := 'AIRFARE';
            Policy."Expense Location Code" := '';
            Policy."Condition Expression" := 'Flights over $500 require advance approval';
            Policy."Receipt Required" := true;
            Policy."Daily Limit Amount" := 500.00;
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;

        // Entertainment receipt requirement
        if not Policy.Get(5) then begin
            Policy.Init();
            Policy."Policy Id" := 5;
            Policy."Expense Category Code" := 'ENTERTAINMENT';
            Policy."Expense Location Code" := '';
            Policy."Condition Expression" := 'Entertainment expenses over $25 require receipts';
            Policy."Receipt Required" := true;
            Policy."Daily Limit Amount" := 25.00;
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;

        // Mileage rate policy
        if not Policy.Get(6) then begin
            Policy.Init();
            Policy."Policy Id" := 6;
            Policy."Expense Category Code" := 'MILEAGE';
            Policy."Expense Location Code" := '';
            Policy."Condition Expression" := 'IRS standard mileage rate';
            Policy."Receipt Required" := false;
            Policy."Daily Limit Amount" := 0.67;  // 2024 IRS rate per mile
            Policy."Effective From" := Today() - 365;
            Policy."Effective To" := Today() + 365;
            Policy.Insert();
        end;
    end;

    local procedure CreateNumberSeries()
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        // Create Expense Report Number Series
        if not NoSeries.Get('EXP-REPORT') then begin
            NoSeries.Init();
            NoSeries.Code := 'EXP-REPORT';
            NoSeries.Description := 'Expense Reports';
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := false;
            NoSeries.Insert();

            // Create number series line
            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := 'EXP-REPORT';
            NoSeriesLine."Line No." := 10000;
            NoSeriesLine."Starting Date" := DMY2Date(1, 1, 2020);
            NoSeriesLine."Starting No." := 'EXP-001';
            NoSeriesLine."Ending No." := 'EXP-999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Open := true;
            NoSeriesLine.Insert();
        end;

        // Create Posted Expense Report Number Series
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
            NoSeriesLine."Starting Date" := DMY2Date(1, 1, 2020);
            NoSeriesLine."Starting No." := 'PEXP-001';
            NoSeriesLine."Ending No." := 'PEXP-999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Open := true;
            NoSeriesLine.Insert();
        end;
    end;

    local procedure CreatePostingGroupIfAccountsExist(Code: Code[20]; Description: Text[100]; RefundableAccount: Code[20]; NonRefundableAccount: Code[20]; PrepaymentAccount: Code[20]): Boolean
    var
        PostingGroup: Record "Expense Posting Groups";
        GLAccount: Record "G/L Account";
        RefundableAccountNo: Code[20];
        NonRefundableAccountNo: Code[20];
        PrepaymentAccountNo: Code[20];
    begin
        // Skip if posting group already exists
        if PostingGroup.Get(Code) then
            exit(false);

        // Validate accounts exist and are posting accounts, set to blank if not
        if GLAccount.Get(RefundableAccount) and (GLAccount."Account Type" = GLAccount."Account Type"::Posting) and not GLAccount.Blocked then
            RefundableAccountNo := RefundableAccount
        else
            RefundableAccountNo := '';

        if GLAccount.Get(NonRefundableAccount) and (GLAccount."Account Type" = GLAccount."Account Type"::Posting) and not GLAccount.Blocked then
            NonRefundableAccountNo := NonRefundableAccount
        else
            NonRefundableAccountNo := '';

        if GLAccount.Get(PrepaymentAccount) and (GLAccount."Account Type" = GLAccount."Account Type"::Posting) and not GLAccount.Blocked then
            PrepaymentAccountNo := PrepaymentAccount
        else
            PrepaymentAccountNo := '';

        // Create the posting group
        PostingGroup.Init();
        PostingGroup."Posting Group Code" := Code;
        PostingGroup."Description" := Description;
        PostingGroup."Refundable Debit Account" := RefundableAccountNo;
        PostingGroup."Non Refundable Debit Account" := NonRefundableAccountNo;
        PostingGroup."Prepayment Credit Account" := PrepaymentAccountNo;
        PostingGroup.Insert();

        exit(true);
    end;
}
