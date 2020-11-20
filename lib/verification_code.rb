module VerificationCode

  def self.create_code(user_id)
    time = Time.now
    sample1 = (1..9).to_a.sample(2)
    sample2 = ("a".."z").to_a.sample(3)
    sample = sample1.join + sample2.join
    code = { time: time, code: sample, user_id: user_id}
    sleep 1
    p code
  end

  def self.verify_code(try_code, code, user_id)
    check_time = false
    check_user = false
    check_code = false

    if Time.now - code[:time] < 1200000
      check_time = true
      p check_time
    end

    if user_id == code[:user_id]
      check_user = true
      p check_user
    end

    if try_code == code[:code]
      p check_code = true
    end

    if check_time && check_code && check_user
      p true
    else
      p false
    end
  end

end
