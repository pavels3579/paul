class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_TRAIN_FORMAT
end
