defmodule InvoiceValidatorTest do
    use ExUnit.Case
    doctest InvoiceValidator
    
    # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
    
    @tag :noroeste
    test "offset: UTC-8 (Baja California[, Tijuana)" do
        Calendar.put_time_zone_database(Tzdata.TimeZoneDatabase) 
        # timbrado: centro
        pac_date = DateTime.from_naive!(~N[2022-10-21 10:10:10], "Mexico/General")
        # emisión: cualquier lugar
        emisor_date1 = DateTime.from_naive!(~N[2022-10-25 10:10:10], "Mexico/BajaNorte")
        emisor_date2 = DateTime.from_naive!(~N[2022-10-21 10:15:10], "Mexico/BajaNorte")
        emisor_date3 = DateTime.from_naive!(~N[2022-10-24 10:14:10], "Mexico/BajaNorte")
        assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} == InvoiceValidator.validate_dates(emisor_date1, pac_date)
        assert {:error, "Invoice is more than 5 mins ahead in time"} == InvoiceValidator.validate_dates(emisor_date2, pac_date)
        assert :ok == InvoiceValidator.validate_dates(emisor_date3, pac_date)
    end

    @tag :pacifico
    test "offset: UTC-7 (Baja California Sur, Chihuahua, Nayarit and Sinaloa)" do
        Calendar.put_time_zone_database(Tzdata.TimeZoneDatabase) 
        # timbrado: centro
        pac_date = DateTime.from_naive!(~N[2022-10-21 10:10:10], "Mexico/General")
        # emisión: cualquier lugar
        emisor_date1 = DateTime.from_naive!(~N[2022-10-25 10:10:10], "Mexico/BajaSur")
        emisor_date2 = DateTime.from_naive!(~N[2022-10-21 10:15:10], "Mexico/BajaSur")
        emisor_date3 = DateTime.from_naive!(~N[2022-10-24 10:14:10], "Mexico/BajaSur")
        assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} == InvoiceValidator.validate_dates(emisor_date1, pac_date)
        assert {:error, "Invoice is more than 5 mins ahead in time"} == InvoiceValidator.validate_dates(emisor_date2, pac_date)
        assert :ok == InvoiceValidator.validate_dates(emisor_date3, pac_date)
    end

    @tag :centro
    test "offset: UTC-6 (centro, All except Baja California, Baja California Sur, Chihuahua, Nayarit, Quintana Roo, Sinaloa and Sonora)" do
        Calendar.put_time_zone_database(Tzdata.TimeZoneDatabase) 
        # timbrado: centro
        pac_date = DateTime.from_naive!(~N[2022-10-21 10:10:10], "Mexico/General")
        # emisión: cualquier lugar
        emisor_date1 = DateTime.from_naive!(~N[2022-10-25 10:10:10], "Mexico/General")
        emisor_date2 = DateTime.from_naive!(~N[2022-10-21 10:15:10], "Mexico/General")
        emisor_date3 = DateTime.from_naive!(~N[2022-10-24 10:14:10], "Mexico/General")
        assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} == InvoiceValidator.validate_dates(emisor_date1, pac_date)
        assert {:error, "Invoice is more than 5 mins ahead in time"} == InvoiceValidator.validate_dates(emisor_date2, pac_date)
        assert :ok == InvoiceValidator.validate_dates(emisor_date3, pac_date)
    end

    
    @tag :sureste
    test "offset: UTC-5 (Quintana Roo)" do
        Calendar.put_time_zone_database(Tzdata.TimeZoneDatabase) 
        # timbrado: centro
        pac_date = DateTime.from_naive!(~N[2022-10-21 10:10:10], "Mexico/General")
        # emisión: cualquier lugar
        emisor_date1 = DateTime.from_naive!(~N[2022-10-25 10:10:10], "America/Cancun")
        emisor_date2 = DateTime.from_naive!(~N[2022-10-21 10:15:10], "America/Cancun")
        emisor_date3 = DateTime.from_naive!(~N[2022-10-24 10:14:10], "America/Cancun")
        assert {:error, "Invoice was issued more than 72 hrs before received by the PAC"} == InvoiceValidator.validate_dates(emisor_date1, pac_date)
        assert {:error, "Invoice is more than 5 mins ahead in time"} == InvoiceValidator.validate_dates(emisor_date2, pac_date)
        assert :ok == InvoiceValidator.validate_dates(emisor_date3, pac_date)
    end

  end
  