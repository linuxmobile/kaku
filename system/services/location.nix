{
  # enable location service
  location = {
    provider = "geoclue2";
    latitude = -38.38;
    longitude = -60.26;
  };

  # provide location
  services.geoclue2.enable = true;
}
