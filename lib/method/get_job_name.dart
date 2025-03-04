String getJobName(int id) {
  if (id == 1) {
    return 'Admin';
  }
  if (id == 2) {
    return 'Trainer';
  } else {
    return 'Receptionist';
  }
}
