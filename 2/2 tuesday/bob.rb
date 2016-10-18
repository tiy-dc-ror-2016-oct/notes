class Bob
  MESSAGES = {
    yelling: "Whoa, chill out!",
    silence: "Fine. Be that way!",
    question: "Sure.",
    whatever:  "Whatever."
  }

  def hey(remark)
    if yelling?(remark)
      MESSAGES[:yelling]
    elsif silence?(remark)
      MESSAGES[:silence]
    elsif question?(remark)
      MESSAGES[:question]
    else
      MESSAGES[:whatever]
    end
  end

  private def silence?(remark)
    remark.strip.empty?
  end

  private def question?(remark)
    remark.end_with?("?")
  end

  private def yelling?(remark)
    !remark.match(/[a-z]/) && remark.match(/[A-Z]/)
  end
end
