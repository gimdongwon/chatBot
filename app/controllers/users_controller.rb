class UsersController < ApplicationController
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
            }
        render json: @msg, status: :ok 
    end
    
    def chat_control
        @response = params[:content]
        @user_key = params[:user_key]
        @user = User.find_or_create_by(password: @user_key)
        
        if @user.name == nil
            if ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"].include? @response
                @response = {
                  message: {
                      text: "More Fit에 방문해주셔서 감사합니다! 최적화 된 의류추천 서비스를 위해 성함을 알려주세요?"
                  },
                  keyboard: {
                    type: "text"
                  }
                }
                
            else
                @user.name = @response
                @user.save
                @response = {
                  message: {
                      text: "환영합니다 #{@user.name}님! 버튼을 눌러주세요!"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                  }
                }
                
            end
            
        else
#나에게 가장 잘 맞는 청바지 추천

             if @response == "나에게 가장 잘맞는 청바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 청바지추천을 누르셨습니다. 추천서비스를 위해 간단한 설문을 진행하겠습니다 #{@user.name}님의 키는 어느 정도인가요?."
                  },
                  keyboard: {
                    type: "buttons",

                    buttons: ["청바지-165이하", "청바지-166~170", "청바지-171~175", "청바지-176~180", "청바지-181~185","청바지-186이상"]
                  }
                }
               render json: @response, status: :ok
#키 설정 165 이하부터
                        
             #나에게 가장 잘 맞는 정장바지 추천   

                            
           elsif @response == "나에게 가장 잘맞는 정장바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 정장바지추천을 누르셨습니다. 당신의 키는?"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["정장바지,166~170", "정장바지,170~175"]

                  }
                }
                render json: @response, status: :ok
  #나에게 가장 잘 맞는 반바지 추천              
            elsif @response == "나에게 가장 잘맞는 반바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 반바지추천을 누르셨습니다. 당신의 키는?"
                  },
                  keyboard: {
                    type: "buttons",

                    buttons: ["반바지,166~170", "반바지,170~175"]
                  }
                }
                render json: @response, status: :ok
                #제현이 부분 시작

                #1차 갈래                
                elsif @response == "청바지-165이하"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-165이하-50kg이하", "청바지-165이하-51kg~60kg", "청바지-165이하-61kg~70kg", "청바지-165이하-71kg~80kg", "청바지-165이하-81kg~90kg", "청바지-165이하-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-166~170"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-166~170-50kg이하", "청바지-166~170-51kg~60kg", "청바지-166~170-61kg~70kg", "청바지-166~170-71kg~80kg", "청바지-166~170-81kg~90kg", "청바지-166~170-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-171~175"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-171~175-50kg이하", "청바지-171~175-51kg~60kg", "청바지-171~175-61kg~70kg", "청바지-171~175-71kg~80kg", "청바지-171~175-81kg~90kg", "청바지-171~175-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-176~180"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-176~180-50kg이하", "청바지-176~180-51kg~60kg", "청바지-176~180-61kg~70kg", "청바지-176~180-71kg~80kg", "청바지-176~180-81kg~90kg", "청바지-176~180-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-181~185"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-181~185-50kg이하", "청바지-181~185-51kg~60kg", "청바지-181~185-61kg~70kg", "청바지-181~185-71kg~80kg", "청바지-181~185-81kg~90kg", "청바지-181~185-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-186이상"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-186이상-50kg이하", "청바지-186이상-51kg~60kg", "청바지-186이상-61kg~70kg", "청바지-186이상-71kg~80kg", "청바지-186이상-81kg~90kg", "청바지-186이상-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                      
                        # 청바지 키- 몸무게
                        # 2차갈래


                                    elsif @response == "청바지-165이하-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-50kg이하-28이하", "청바지-165이하-50kg이하-29", "청바지-165이하-50kg이하-30", "청바지-165이하-50kg이하-31", "청바지-165이하-50kg이하-32", "청바지-165이하-50kg이하-33", "청바지-165이하-50kg이하-34", "청바지-165이하-50kg이하-35", "청바지-165이하-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-50kg이하-28이하", "청바지-166~170-50kg이하-29", "청바지-166~170-50kg이하-30", "청바지-166~170-50kg이하-31", "청바지-166~170-50kg이하-32", "청바지-166~170-50kg이하-33", "청바지-166~170-50kg이하-34", "청바지-166~170-50kg이하-35", "청바지-166~170-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-50kg이하-28이하", "청바지-171~175-50kg이하-29", "청바지-171~175-50kg이하-30", "청바지-171~175-50kg이하-31", "청바지-171~175-50kg이하-32", "청바지-171~175-50kg이하-33", "청바지-171~175-50kg이하-34", "청바지-171~175-50kg이하-35", "청바지-171~175-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok

                                    elsif @response == "청바지-176~180-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-50kg이하-28이하", "청바지-176~180-50kg이하-29", "청바지-176~180-50kg이하-30", "청바지-176~180-50kg이하-31", "청바지-176~180-50kg이하-32", "청바지-176~180-50kg이하-33", "청바지-176~180-50kg이하-34", "청바지-176~180-50kg이하-35", "청바지-176~180-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok

                                    elsif @response == "청바지-181~185-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-50kg이하-28이하", "청바지-181~185-50kg이하-29", "청바지-181~185-50kg이하-30", "청바지-181~185-50kg이하-31", "청바지-181~185-50kg이하-32", "청바지-181~185-50kg이하-33", "청바지-181~185-50kg이하-34", "청바지-181~185-50kg이하-35", "청바지-181~185-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-50kg이하-28이하", "청바지-186이상-50kg이하-29", "청바지-186이상-50kg이하-30", "청바지-186이상-50kg이하-31", "청바지-186이상-50kg이하-32", "청바지-186이상-50kg이하-33", "청바지-186이상-50kg이하-34", "청바지-186이상-50kg이하-35", "청바지-186이상-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-51kg~60kg-28이하", "청바지-165이하-51kg~60kg-29", "청바지-165이하-51kg~60kg-30", "청바지-165이하-51kg~60kg-31", "청바지-165이하-51kg~60kg-32", "청바지-165이하-51kg~60kg-33", "청바지-165이하-51kg~60kg-34", "청바지-165이하-51kg~60kg-35", "청바지-165이하-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-61kg~70kg-28이하", "청바지-165이하-61kg~70kg-29", "청바지-165이하-61kg~70kg-30", "청바지-165이하-61kg~70kg-31", "청바지-165이하-61kg~70kg-32", "청바지-165이하-61kg~70kg-33", "청바지-165이하-61kg~70kg-34", "청바지-165이하-61kg~70kg-35", "청바지-165이하-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-71kg~80kg-28이하", "청바지-165이하-71kg~80kg-29", "청바지-165이하-71kg~80kg-30", "청바지-165이하-71kg~80kg-31", "청바지-165이하-71kg~80kg-32", "청바지-165이하-71kg~80kg-33", "청바지-165이하-71kg~80kg-34", "청바지-165이하-71kg~80kg-35", "청바지-165이하-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-81kg~90kg-28이하", "청바지-165이하-81kg~90kg-29", "청바지-165이하-81kg~90kg-30", "청바지-165이하-81kg~90kg-31", "청바지-165이하-81kg~90kg-32", "청바지-165이하-81kg~90kg-33", "청바지-165이하-81kg~90kg-34", "청바지-165이하-81kg~90kg-35", "청바지-165이하-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-91kg이상-28이하", "청바지-165이하-91kg이상-29", "청바지-165이하-91kg이상-30", "청바지-165이하-91kg이상-31", "청바지-165이하-91kg이상-32", "청바지-165이하-91kg이상-33", "청바지-165이하-91kg이상-34", "청바지-165이하-91kg이상-35", "청바지-165이하-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    
                                    elsif @response == "청바지-166~170-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-51kg~60kg-28이하", "청바지-166~170-51kg~60kg-29", "청바지-166~170-51kg~60kg-30", "청바지-166~170-51kg~60kg-31", "청바지-166~170-51kg~60kg-32", "청바지-166~170-51kg~60kg-33", "청바지-166~170-51kg~60kg-34", "청바지-166~170-51kg~60kg-35", "청바지-166~170-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-61kg~70kg-28이하", "청바지-166~170-61kg~70kg-29", "청바지-166~170-61kg~70kg-30", "청바지-166~170-61kg~70kg-31", "청바지-166~170-61kg~70kg-32", "청바지-166~170-61kg~70kg-33", "청바지-166~170-61kg~70kg-34", "청바지-166~170-61kg~70kg-35", "청바지-166~170-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-71kg~80kg-28이하", "청바지-166~170-71kg~80kg-29", "청바지-166~170-71kg~80kg-30", "청바지-166~170-71kg~80kg-31", "청바지-166~170-71kg~80kg-32", "청바지-166~170-71kg~80kg-33", "청바지-166~170-71kg~80kg-34", "청바지-166~170-71kg~80kg-35", "청바지-166~170-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-81kg~90kg-28이하", "청바지-166~170-81kg~90kg-29", "청바지-166~170-81kg~90kg-30", "청바지-166~170-81kg~90kg-31", "청바지-166~170-81kg~90kg-32", "청바지-166~170-81kg~90kg-33", "청바지-166~170-81kg~90kg-34", "청바지-166~170-81kg~90kg-35", "청바지-166~170-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-91kg이상-28이하", "청바지-166~170-91kg이상-29", "청바지-166~170-91kg이상-30", "청바지-166~170-91kg이상-31", "청바지-166~170-91kg이상-32", "청바지-166~170-91kg이상-33", "청바지-166~170-91kg이상-34", "청바지-166~170-91kg이상-35", "청바지-166~170-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-51kg~60kg-28이하", "청바지-171~175-51kg~60kg-29", "청바지-171~175-51kg~60kg-30", "청바지-171~175-51kg~60kg-31", "청바지-171~175-51kg~60kg-32", "청바지-171~175-51kg~60kg-33", "청바지-171~175-51kg~60kg-34", "청바지-171~175-51kg~60kg-35", "청바지-171~175-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-61kg~70kg-28이하", "청바지-171~175-61kg~70kg-29", "청바지-171~175-61kg~70kg-30", "청바지-171~175-61kg~70kg-31", "청바지-171~175-61kg~70kg-32", "청바지-171~175-61kg~70kg-33", "청바지-171~175-61kg~70kg-34", "청바지-171~175-61kg~70kg-35", "청바지-171~175-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-71kg~80kg-28이하", "청바지-171~175-71kg~80kg-29", "청바지-171~175-71kg~80kg-30", "청바지-171~175-71kg~80kg-31", "청바지-171~175-71kg~80kg-32", "청바지-171~175-71kg~80kg-33", "청바지-171~175-71kg~80kg-34", "청바지-171~175-71kg~80kg-35", "청바지-171~175-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-81kg~90kg-28이하", "청바지-171~175-81kg~90kg-29", "청바지-171~175-81kg~90kg-30", "청바지-171~175-81kg~90kg-31", "청바지-171~175-81kg~90kg-32", "청바지-171~175-81kg~90kg-33", "청바지-171~175-81kg~90kg-34", "청바지-171~175-81kg~90kg-35", "청바지-171~175-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-91kg이상-28이하", "청바지-171~175-91kg이상-29", "청바지-171~175-91kg이상-30", "청바지-171~175-91kg이상-31", "청바지-171~175-91kg이상-32", "청바지-171~175-91kg이상-33", "청바지-171~175-91kg이상-34", "청바지-171~175-91kg이상-35", "청바지-171~175-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok

                                    elsif @response == "청바지-176~180-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-51kg~60kg-28이하", "청바지-176~180-51kg~60kg-29", "청바지-176~180-51kg~60kg-30", "청바지-176~180-51kg~60kg-31", "청바지-176~180-51kg~60kg-32", "청바지-176~180-51kg~60kg-33", "청바지-176~180-51kg~60kg-34", "청바지-176~180-51kg~60kg-35", "청바지-176~180-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-61kg~70kg-28이하", "청바지-176~180-61kg~70kg-29", "청바지-176~180-61kg~70kg-30", "청바지-176~180-61kg~70kg-31", "청바지-176~180-61kg~70kg-32", "청바지-176~180-61kg~70kg-33", "청바지-176~180-61kg~70kg-34", "청바지-176~180-61kg~70kg-35", "청바지-176~180-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-71kg~80kg-28이하", "청바지-176~180-71kg~80kg-29", "청바지-176~180-71kg~80kg-30", "청바지-176~180-71kg~80kg-31", "청바지-176~180-71kg~80kg-32", "청바지-176~180-71kg~80kg-33", "청바지-176~180-71kg~80kg-34", "청바지-176~180-71kg~80kg-35", "청바지-176~180-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-81kg~90kg-28이하", "청바지-176~180-81kg~90kg-29", "청바지-176~180-81kg~90kg-30", "청바지-176~180-81kg~90kg-31", "청바지-176~180-81kg~90kg-32", "청바지-176~180-81kg~90kg-33", "청바지-176~180-81kg~90kg-34", "청바지-176~180-81kg~90kg-35", "청바지-176~180-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-91kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-91kg-28이하", "청바지-176~180-91kg-29", "청바지-176~180-91kg-30", "청바지-176~180-91kg-31", "청바지-176~180-91kg-32", "청바지-176~180-91kg-33", "청바지-176~180-91kg-34", "청바지-176~180-91kg-35", "청바지-176~180-91kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-51kg~60kg-28이하", "청바지-181~185-51kg~60kg-29", "청바지-181~185-51kg~60kg-30", "청바지-181~185-51kg~60kg-31", "청바지-181~185-51kg~60kg-32", "청바지-181~185-51kg~60kg-33", "청바지-181~185-51kg~60kg-34", "청바지-181~185-51kg~60kg-35", "청바지-181~185-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-61kg~70kg-28이하", "청바지-181~185-61kg~70kg-29", "청바지-181~185-61kg~70kg-30", "청바지-181~185-61kg~70kg-31", "청바지-181~185-61kg~70kg-32", "청바지-181~185-61kg~70kg-33", "청바지-181~185-61kg~70kg-34", "청바지-181~185-61kg~70kg-35", "청바지-181~185-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-71kg~80kg-28이하", "청바지-181~185-71kg~80kg-29", "청바지-181~185-71kg~80kg-30", "청바지-181~185-71kg~80kg-31", "청바지-181~185-71kg~80kg-32", "청바지-181~185-71kg~80kg-33", "청바지-181~185-71kg~80kg-34", "청바지-181~185-71kg~80kg-35", "청바지-181~185-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-81kg~90kg-28이하", "청바지-181~185-81kg~90kg-29", "청바지-181~185-81kg~90kg-30", "청바지-181~185-81kg~90kg-31", "청바지-181~185-81kg~90kg-32", "청바지-181~185-81kg~90kg-33", "청바지-181~185-81kg~90kg-34", "청바지-181~185-81kg~90kg-35", "청바지-181~185-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-91kg이상-28이하", "청바지-181~185-91kg이상-29", "청바지-181~185-91kg이상-30", "청바지-181~185-91kg이상-31", "청바지-181~185-91kg이상-32", "청바지-181~185-91kg이상-33", "청바지-181~185-91kg이상-34", "청바지-181~185-91kg이상-35", "청바지-181~185-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-51kg~60kg-28이하", "청바지-186이상-51kg~60kg-29", "청바지-186이상-51kg~60kg-30", "청바지-186이상-51kg~60kg-31", "청바지-186이상-51kg~60kg-32", "청바지-186이상-51kg~60kg-33", "청바지-186이상-51kg~60kg-34", "청바지-186이상-51kg~60kg-35", "청바지-186이상-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-61kg~70kg-28이하", "청바지-186이상-61kg~70kg-29", "청바지-186이상-61kg~70kg-30", "청바지-186이상-61kg~70kg-31", "청바지-186이상-61kg~70kg-32", "청바지-186이상-61kg~70kg-33", "청바지-186이상-61kg~70kg-34", "청바지-186이상-61kg~70kg-35", "청바지-186이상-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-71kg~80kg-28이하", "청바지-186이상-71kg~80kg-29", "청바지-186이상-71kg~80kg-30", "청바지-186이상-71kg~80kg-31", "청바지-186이상-71kg~80kg-32", "청바지-186이상-71kg~80kg-33", "청바지-186이상-71kg~80kg-34", "청바지-186이상-71kg~80kg-35", "청바지-186이상-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-81kg~90kg-28이하", "청바지-186이상-81kg~90kg-29", "청바지-186이상-81kg~90kg-30", "청바지-186이상-81kg~90kg-31", "청바지-186이상-81kg~90kg-32", "청바지-186이상-81kg~90kg-33", "청바지-186이상-81kg~90kg-34", "청바지-186이상-81kg~90kg-35", "청바지-186이상-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-91kg이상-28이하", "청바지-186이상-91kg이상-29", "청바지-186이상-91kg이상-30", "청바지-186이상-91kg이상-31", "청바지-186이상-91kg이상-32", "청바지-186이상-91kg이상-33", "청바지-186이상-91kg이상-34", "청바지-186이상-91kg이상-35", "청바지-186이상-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                                          # 핏 시작




                                                          elsif @response == "청바지-165이하-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-28이하-스키니핏", "청바지-165이하-50kg이하-28이하-슬림 스트레이트핏", "청바지-165이하-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-29-스키니핏", "청바지-165이하-50kg이하-29-슬림 스트레이트핏", "청바지-165이하-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-30-스키니핏", "청바지-165이하-50kg이하-30-슬림 스트레이트핏", "청바지-165이하-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-31-스키니핏", "청바지-165이하-50kg이하-31-슬림 스트레이트핏", "청바지-165이하-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-32-스키니핏", "청바지-165이하-50kg이하-32-슬림 스트레이트핏", "청바지-165이하-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-33-스키니핏", "청바지-165이하-50kg이하-33-슬림 스트레이트핏", "청바지-165이하-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-34-스키니핏", "청바지-165이하-50kg이하-34-슬림 스트레이트핏", "청바지-165이하-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-35-스키니핏", "청바지-165이하-50kg이하-35-슬림 스트레이트핏", "청바지-165이하-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-36이상-스키니핏", "청바지-165이하-50kg이하-36이상-슬림 스트레이트핏", "청바지-165이하-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-165이하-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-28이하-스키니핏", "청바지-165이하-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-29-스키니핏", "청바지-165이하-51kg~60kg-29-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-30-스키니핏", "청바지-165이하-51kg~60kg-30-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-31-스키니핏", "청바지-165이하-51kg~60kg-31-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-32-스키니핏", "청바지-165이하-51kg~60kg-32-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-33-스키니핏", "청바지-165이하-51kg~60kg-33-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-34-스키니핏", "청바지-165이하-51kg~60kg-34-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-35-스키니핏", "청바지-165이하-51kg~60kg-35-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-36이상-스키니핏", "청바지-165이하-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-165이하-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-28이하-스키니핏", "청바지-165이하-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-29-스키니핏", "청바지-165이하-61kg~70kg-29-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-30-스키니핏", "청바지-165이하-61kg~70kg-30-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-31-스키니핏", "청바지-165이하-61kg~70kg-31-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-32-스키니핏", "청바지-165이하-61kg~70kg-32-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-33-스키니핏", "청바지-165이하-61kg~70kg-33-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-34-스키니핏", "청바지-165이하-61kg~70kg-34-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-35-스키니핏", "청바지-165이하-61kg~70kg-35-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-36이상-스키니핏", "청바지-165이하-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-165이하-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-28이하-스키니핏", "청바지-165이하-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-29-스키니핏", "청바지-165이하-71kg~80kg-29-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-30-스키니핏", "청바지-165이하-71kg~80kg-30-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-31-스키니핏", "청바지-165이하-71kg~80kg-31-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-32-스키니핏", "청바지-165이하-71kg~80kg-32-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-33-스키니핏", "청바지-165이하-71kg~80kg-33-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-34-스키니핏", "청바지-165이하-71kg~80kg-34-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-35-스키니핏", "청바지-165이하-71kg~80kg-35-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-36이상-스키니핏", "청바지-165이하-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-165이하-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-28이하-스키니핏", "청바지-165이하-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-29-스키니핏", "청바지-165이하-81kg~90kg-29-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-30-스키니핏", "청바지-165이하-81kg~90kg-30-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-31-스키니핏", "청바지-165이하-81kg~90kg-31-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-32-스키니핏", "청바지-165이하-81kg~90kg-32-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-33-스키니핏", "청바지-165이하-81kg~90kg-33-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-34-스키니핏", "청바지-165이하-81kg~90kg-34-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-35-스키니핏", "청바지-165이하-81kg~90kg-35-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-36이상-스키니핏", "청바지-165이하-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-165이하-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-28이하-스키니핏", "청바지-165이하-91kg이상-28이하-슬림 스트레이트핏", "청바지-165이하-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-29-스키니핏", "청바지-165이하-91kg이상-29-슬림 스트레이트핏", "청바지-165이하-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-30-스키니핏", "청바지-165이하-91kg이상-30-슬림 스트레이트핏", "청바지-165이하-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-31-스키니핏", "청바지-165이하-91kg이상-31-슬림 스트레이트핏", "청바지-165이하-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-32-스키니핏", "청바지-165이하-91kg이상-32-슬림 스트레이트핏", "청바지-165이하-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-33-스키니핏", "청바지-165이하-91kg이상-33-슬림 스트레이트핏", "청바지-165이하-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-34-스키니핏", "청바지-165이하-91kg이상-34-슬림 스트레이트핏", "청바지-165이하-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-35-스키니핏", "청바지-165이하-91kg이상-35-슬림 스트레이트핏", "청바지-165이하-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-36이상-스키니핏", "청바지-165이하-91kg이상-36이상-슬림 스트레이트핏", "청바지-165이하-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          
                                                          elsif @response == "청바지-166~170-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-28이하-스키니핏", "청바지-166~170-50kg이하-28이하-슬림 스트레이트핏", "청바지-166~170-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-29-스키니핏", "청바지-166~170-50kg이하-29-슬림 스트레이트핏", "청바지-166~170-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-30-스키니핏", "청바지-166~170-50kg이하-30-슬림 스트레이트핏", "청바지-166~170-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-31-스키니핏", "청바지-166~170-50kg이하-31-슬림 스트레이트핏", "청바지-166~170-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-32-스키니핏", "청바지-166~170-50kg이하-32-슬림 스트레이트핏", "청바지-166~170-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-33-스키니핏", "청바지-166~170-50kg이하-33-슬림 스트레이트핏", "청바지-166~170-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-34-스키니핏", "청바지-166~170-50kg이하-34-슬림 스트레이트핏", "청바지-166~170-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-35-스키니핏", "청바지-166~170-50kg이하-35-슬림 스트레이트핏", "청바지-166~170-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-36이상-스키니핏", "청바지-166~170-50kg이하-36이상-슬림 스트레이트핏", "청바지-166~170-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-166~170-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-28이하-스키니핏", "청바지-166~170-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-29-스키니핏", "청바지-166~170-51kg~60kg-29-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-30-스키니핏", "청바지-166~170-51kg~60kg-30-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-31-스키니핏", "청바지-166~170-51kg~60kg-31-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-32-스키니핏", "청바지-166~170-51kg~60kg-32-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-33-스키니핏", "청바지-166~170-51kg~60kg-33-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-34-스키니핏", "청바지-166~170-51kg~60kg-34-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-35-스키니핏", "청바지-166~170-51kg~60kg-35-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-36이상-스키니핏", "청바지-166~170-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-166~170-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-28이하-스키니핏", "청바지-166~170-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-29-스키니핏", "청바지-166~170-61kg~70kg-29-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-30-스키니핏", "청바지-166~170-61kg~70kg-30-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-31-스키니핏", "청바지-166~170-61kg~70kg-31-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-32-스키니핏", "청바지-166~170-61kg~70kg-32-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-33-스키니핏", "청바지-166~170-61kg~70kg-33-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-34-스키니핏", "청바지-166~170-61kg~70kg-34-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-35-스키니핏", "청바지-166~170-61kg~70kg-35-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-36이상-스키니핏", "청바지-166~170-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-166~170-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-28이하-스키니핏", "청바지-166~170-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-29-스키니핏", "청바지-166~170-71kg~80kg-29-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-30-스키니핏", "청바지-166~170-71kg~80kg-30-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-31-스키니핏", "청바지-166~170-71kg~80kg-31-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-32-스키니핏", "청바지-166~170-71kg~80kg-32-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-33-스키니핏", "청바지-166~170-71kg~80kg-33-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-34-스키니핏", "청바지-166~170-71kg~80kg-34-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-35-스키니핏", "청바지-166~170-71kg~80kg-35-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-36이상-스키니핏", "청바지-166~170-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-166~170-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-28이하-스키니핏", "청바지-166~170-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-29-스키니핏", "청바지-166~170-81kg~90kg-29-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-30-스키니핏", "청바지-166~170-81kg~90kg-30-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-31-스키니핏", "청바지-166~170-81kg~90kg-31-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-32-스키니핏", "청바지-166~170-81kg~90kg-32-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-33-스키니핏", "청바지-166~170-81kg~90kg-33-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-34-스키니핏", "청바지-166~170-81kg~90kg-34-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-35-스키니핏", "청바지-166~170-81kg~90kg-35-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-36이상-스키니핏", "청바지-166~170-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-166~170-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-28이하-스키니핏", "청바지-166~170-91kg이상-28이하-슬림 스트레이트핏", "청바지-166~170-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-29-스키니핏", "청바지-166~170-91kg이상-29-슬림 스트레이트핏", "청바지-166~170-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-30-스키니핏", "청바지-166~170-91kg이상-30-슬림 스트레이트핏", "청바지-166~170-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-31-스키니핏", "청바지-166~170-91kg이상-31-슬림 스트레이트핏", "청바지-166~170-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-32-스키니핏", "청바지-166~170-91kg이상-32-슬림 스트레이트핏", "청바지-166~170-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-33-스키니핏", "청바지-166~170-91kg이상-33-슬림 스트레이트핏", "청바지-166~170-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-34-스키니핏", "청바지-166~170-91kg이상-34-슬림 스트레이트핏", "청바지-166~170-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-35-스키니핏", "청바지-166~170-91kg이상-35-슬림 스트레이트핏", "청바지-166~170-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-36이상-스키니핏", "청바지-166~170-91kg이상-36이상-슬림 스트레이트핏", "청바지-166~170-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok

                                                          elsif @response == "청바지-171~175-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-28이하-스키니핏", "청바지-171~175-50kg이하-28이하-슬림 스트레이트핏", "청바지-171~175-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-29-스키니핏", "청바지-171~175-50kg이하-29-슬림 스트레이트핏", "청바지-171~175-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-30-스키니핏", "청바지-171~175-50kg이하-30-슬림 스트레이트핏", "청바지-171~175-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-31-스키니핏", "청바지-171~175-50kg이하-31-슬림 스트레이트핏", "청바지-171~175-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-32-스키니핏", "청바지-171~175-50kg이하-32-슬림 스트레이트핏", "청바지-171~175-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-33-스키니핏", "청바지-171~175-50kg이하-33-슬림 스트레이트핏", "청바지-171~175-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-34-스키니핏", "청바지-171~175-50kg이하-34-슬림 스트레이트핏", "청바지-171~175-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-35-스키니핏", "청바지-171~175-50kg이하-35-슬림 스트레이트핏", "청바지-171~175-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-36이상-스키니핏", "청바지-171~175-50kg이하-36이상-슬림 스트레이트핏", "청바지-171~175-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-171~175-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-28이하-스키니핏", "청바지-171~175-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-29-스키니핏", "청바지-171~175-51kg~60kg-29-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-30-스키니핏", "청바지-171~175-51kg~60kg-30-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-31-스키니핏", "청바지-171~175-51kg~60kg-31-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-32-스키니핏", "청바지-171~175-51kg~60kg-32-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-33-스키니핏", "청바지-171~175-51kg~60kg-33-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-34-스키니핏", "청바지-171~175-51kg~60kg-34-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-35-스키니핏", "청바지-171~175-51kg~60kg-35-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-36이상-스키니핏", "청바지-171~175-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-171~175-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-28이하-스키니핏", "청바지-171~175-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-29-스키니핏", "청바지-171~175-61kg~70kg-29-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-30-스키니핏", "청바지-171~175-61kg~70kg-30-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-31-스키니핏", "청바지-171~175-61kg~70kg-31-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-32-스키니핏", "청바지-171~175-61kg~70kg-32-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-33-스키니핏", "청바지-171~175-61kg~70kg-33-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-34-스키니핏", "청바지-171~175-61kg~70kg-34-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-35-스키니핏", "청바지-171~175-61kg~70kg-35-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-36이상-스키니핏", "청바지-171~175-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-171~175-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-28이하-스키니핏", "청바지-171~175-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-29-스키니핏", "청바지-171~175-71kg~80kg-29-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-30-스키니핏", "청바지-171~175-71kg~80kg-30-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-31-스키니핏", "청바지-171~175-71kg~80kg-31-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-32-스키니핏", "청바지-171~175-71kg~80kg-32-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-33-스키니핏", "청바지-171~175-71kg~80kg-33-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-34-스키니핏", "청바지-171~175-71kg~80kg-34-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-35-스키니핏", "청바지-171~175-71kg~80kg-35-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-36이상-스키니핏", "청바지-171~175-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-171~175-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-28이하-스키니핏", "청바지-171~175-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-29-스키니핏", "청바지-171~175-81kg~90kg-29-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-30-스키니핏", "청바지-171~175-81kg~90kg-30-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-31-스키니핏", "청바지-171~175-81kg~90kg-31-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-32-스키니핏", "청바지-171~175-81kg~90kg-32-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-33-스키니핏", "청바지-171~175-81kg~90kg-33-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-34-스키니핏", "청바지-171~175-81kg~90kg-34-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-35-스키니핏", "청바지-171~175-81kg~90kg-35-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-36이상-스키니핏", "청바지-171~175-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-171~175-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-28이하-스키니핏", "청바지-171~175-91kg이상-28이하-슬림 스트레이트핏", "청바지-171~175-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-29-스키니핏", "청바지-171~175-91kg이상-29-슬림 스트레이트핏", "청바지-171~175-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-30-스키니핏", "청바지-171~175-91kg이상-30-슬림 스트레이트핏", "청바지-171~175-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-31-스키니핏", "청바지-171~175-91kg이상-31-슬림 스트레이트핏", "청바지-171~175-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-32-스키니핏", "청바지-171~175-91kg이상-32-슬림 스트레이트핏", "청바지-171~175-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-33-스키니핏", "청바지-171~175-91kg이상-33-슬림 스트레이트핏", "청바지-171~175-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-34-스키니핏", "청바지-171~175-91kg이상-34-슬림 스트레이트핏", "청바지-171~175-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-35-스키니핏", "청바지-171~175-91kg이상-35-슬림 스트레이트핏", "청바지-171~175-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-36이상-스키니핏", "청바지-171~175-91kg이상-36이상-슬림 스트레이트핏", "청바지-171~175-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok

                                                          elsif @response == "청바지-176~180-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-28이하-스키니핏", "청바지-176~180-50kg이하-28이하-슬림 스트레이트핏", "청바지-176~180-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-29-스키니핏", "청바지-176~180-50kg이하-29-슬림 스트레이트핏", "청바지-176~180-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-30-스키니핏", "청바지-176~180-50kg이하-30-슬림 스트레이트핏", "청바지-176~180-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-31-스키니핏", "청바지-176~180-50kg이하-31-슬림 스트레이트핏", "청바지-176~180-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-32-스키니핏", "청바지-176~180-50kg이하-32-슬림 스트레이트핏", "청바지-176~180-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-33-스키니핏", "청바지-176~180-50kg이하-33-슬림 스트레이트핏", "청바지-176~180-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-34-스키니핏", "청바지-176~180-50kg이하-34-슬림 스트레이트핏", "청바지-176~180-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-35-스키니핏", "청바지-176~180-50kg이하-35-슬림 스트레이트핏", "청바지-176~180-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-36이상-스키니핏", "청바지-176~180-50kg이하-36이상-슬림 스트레이트핏", "청바지-176~180-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-176~180-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-28이하-스키니핏", "청바지-176~180-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-29-스키니핏", "청바지-176~180-51kg~60kg-29-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-30-스키니핏", "청바지-176~180-51kg~60kg-30-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-31-스키니핏", "청바지-176~180-51kg~60kg-31-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-32-스키니핏", "청바지-176~180-51kg~60kg-32-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-33-스키니핏", "청바지-176~180-51kg~60kg-33-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-34-스키니핏", "청바지-176~180-51kg~60kg-34-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-35-스키니핏", "청바지-176~180-51kg~60kg-35-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-36이상-스키니핏", "청바지-176~180-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-176~180-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-28이하-스키니핏", "청바지-176~180-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-29-스키니핏", "청바지-176~180-61kg~70kg-29-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-30-스키니핏", "청바지-176~180-61kg~70kg-30-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-31-스키니핏", "청바지-176~180-61kg~70kg-31-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-32-스키니핏", "청바지-176~180-61kg~70kg-32-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-33-스키니핏", "청바지-176~180-61kg~70kg-33-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-34-스키니핏", "청바지-176~180-61kg~70kg-34-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-35-스키니핏", "청바지-176~180-61kg~70kg-35-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-36이상-스키니핏", "청바지-176~180-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-176~180-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-28이하-스키니핏", "청바지-176~180-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-29-스키니핏", "청바지-176~180-71kg~80kg-29-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-30-스키니핏", "청바지-176~180-71kg~80kg-30-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-31-스키니핏", "청바지-176~180-71kg~80kg-31-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-32-스키니핏", "청바지-176~180-71kg~80kg-32-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-33-스키니핏", "청바지-176~180-71kg~80kg-33-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-34-스키니핏", "청바지-176~180-71kg~80kg-34-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-35-스키니핏", "청바지-176~180-71kg~80kg-35-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-36이상-스키니핏", "청바지-176~180-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-176~180-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-28이하-스키니핏", "청바지-176~180-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-29-스키니핏", "청바지-176~180-81kg~90kg-29-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-30-스키니핏", "청바지-176~180-81kg~90kg-30-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-31-스키니핏", "청바지-176~180-81kg~90kg-31-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-32-스키니핏", "청바지-176~180-81kg~90kg-32-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-33-스키니핏", "청바지-176~180-81kg~90kg-33-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-34-스키니핏", "청바지-176~180-81kg~90kg-34-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-35-스키니핏", "청바지-176~180-81kg~90kg-35-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-36이상-스키니핏", "청바지-176~180-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-176~180-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-28이하-스키니핏", "청바지-176~180-91kg이상-28이하-슬림 스트레이트핏", "청바지-176~180-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-29-스키니핏", "청바지-176~180-91kg이상-29-슬림 스트레이트핏", "청바지-176~180-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-30-스키니핏", "청바지-176~180-91kg이상-30-슬림 스트레이트핏", "청바지-176~180-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-31-스키니핏", "청바지-176~180-91kg이상-31-슬림 스트레이트핏", "청바지-176~180-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-32-스키니핏", "청바지-176~180-91kg이상-32-슬림 스트레이트핏", "청바지-176~180-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-33-스키니핏", "청바지-176~180-91kg이상-33-슬림 스트레이트핏", "청바지-176~180-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-34-스키니핏", "청바지-176~180-91kg이상-34-슬림 스트레이트핏", "청바지-176~180-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-35-스키니핏", "청바지-176~180-91kg이상-35-슬림 스트레이트핏", "청바지-176~180-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-36이상-스키니핏", "청바지-176~180-91kg이상-36이상-슬림 스트레이트핏", "청바지-176~180-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          

                                                                  # 181~185
                                                          elsif @response == "청바지-181~185-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-28이하-스키니핏", "청바지-181~185-50kg이하-28이하-슬림 스트레이트핏", "청바지-181~185-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-29-스키니핏", "청바지-181~185-50kg이하-29-슬림 스트레이트핏", "청바지-181~185-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-30-스키니핏", "청바지-181~185-50kg이하-30-슬림 스트레이트핏", "청바지-181~185-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-31-스키니핏", "청바지-181~185-50kg이하-31-슬림 스트레이트핏", "청바지-181~185-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-32-스키니핏", "청바지-181~185-50kg이하-32-슬림 스트레이트핏", "청바지-181~185-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-33-스키니핏", "청바지-181~185-50kg이하-33-슬림 스트레이트핏", "청바지-181~185-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-34-스키니핏", "청바지-181~185-50kg이하-34-슬림 스트레이트핏", "청바지-181~185-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-35-스키니핏", "청바지-181~185-50kg이하-35-슬림 스트레이트핏", "청바지-181~185-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-36이상-스키니핏", "청바지-181~185-50kg이하-36이상-슬림 스트레이트핏", "청바지-181~185-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-181~185-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-28이하-스키니핏", "청바지-181~185-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-29-스키니핏", "청바지-181~185-51kg~60kg-29-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-30-스키니핏", "청바지-181~185-51kg~60kg-30-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-31-스키니핏", "청바지-181~185-51kg~60kg-31-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-32-스키니핏", "청바지-181~185-51kg~60kg-32-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-33-스키니핏", "청바지-181~185-51kg~60kg-33-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-34-스키니핏", "청바지-181~185-51kg~60kg-34-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-35-스키니핏", "청바지-181~185-51kg~60kg-35-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-36이상-스키니핏", "청바지-181~185-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-181~185-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-28이하-스키니핏", "청바지-181~185-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-29-스키니핏", "청바지-181~185-61kg~70kg-29-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-30-스키니핏", "청바지-181~185-61kg~70kg-30-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-31-스키니핏", "청바지-181~185-61kg~70kg-31-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-32-스키니핏", "청바지-181~185-61kg~70kg-32-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-33-스키니핏", "청바지-181~185-61kg~70kg-33-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-34-스키니핏", "청바지-181~185-61kg~70kg-34-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-35-스키니핏", "청바지-181~185-61kg~70kg-35-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-36이상-스키니핏", "청바지-181~185-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-181~185-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-28이하-스키니핏", "청바지-181~185-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-29-스키니핏", "청바지-181~185-71kg~80kg-29-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-30-스키니핏", "청바지-181~185-71kg~80kg-30-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-31-스키니핏", "청바지-181~185-71kg~80kg-31-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-32-스키니핏", "청바지-181~185-71kg~80kg-32-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-33-스키니핏", "청바지-181~185-71kg~80kg-33-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-34-스키니핏", "청바지-181~185-71kg~80kg-34-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-35-스키니핏", "청바지-181~185-71kg~80kg-35-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-36이상-스키니핏", "청바지-181~185-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-181~185-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-28이하-스키니핏", "청바지-181~185-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-29-스키니핏", "청바지-181~185-81kg~90kg-29-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-30-스키니핏", "청바지-181~185-81kg~90kg-30-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-31-스키니핏", "청바지-181~185-81kg~90kg-31-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-32-스키니핏", "청바지-181~185-81kg~90kg-32-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-33-스키니핏", "청바지-181~185-81kg~90kg-33-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-34-스키니핏", "청바지-181~185-81kg~90kg-34-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-35-스키니핏", "청바지-181~185-81kg~90kg-35-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-36이상-스키니핏", "청바지-181~185-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-181~185-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-28이하-스키니핏", "청바지-181~185-91kg이상-28이하-슬림 스트레이트핏", "청바지-181~185-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-29-스키니핏", "청바지-181~185-91kg이상-29-슬림 스트레이트핏", "청바지-181~185-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-30-스키니핏", "청바지-181~185-91kg이상-30-슬림 스트레이트핏", "청바지-181~185-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-31-스키니핏", "청바지-181~185-91kg이상-31-슬림 스트레이트핏", "청바지-181~185-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-32-스키니핏", "청바지-181~185-91kg이상-32-슬림 스트레이트핏", "청바지-181~185-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-33-스키니핏", "청바지-181~185-91kg이상-33-슬림 스트레이트핏", "청바지-181~185-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-34-스키니핏", "청바지-181~185-91kg이상-34-슬림 스트레이트핏", "청바지-181~185-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-35-스키니핏", "청바지-181~185-91kg이상-35-슬림 스트레이트핏", "청바지-181~185-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-36이상-스키니핏", "청바지-181~185-91kg이상-36이상-슬림 스트레이트핏", "청바지-181~185-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          # 186이상

                                                          elsif @response == "청바지-186이상-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-28이하-스키니핏", "청바지-186이상-50kg이하-28이하-슬림 스트레이트핏", "청바지-186이상-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-29-스키니핏", "청바지-186이상-50kg이하-29-슬림 스트레이트핏", "청바지-186이상-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-30-스키니핏", "청바지-186이상-50kg이하-30-슬림 스트레이트핏", "청바지-186이상-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-31-스키니핏", "청바지-186이상-50kg이하-31-슬림 스트레이트핏", "청바지-186이상-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-32-스키니핏", "청바지-186이상-50kg이하-32-슬림 스트레이트핏", "청바지-186이상-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-33-스키니핏", "청바지-186이상-50kg이하-33-슬림 스트레이트핏", "청바지-186이상-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-34-스키니핏", "청바지-186이상-50kg이하-34-슬림 스트레이트핏", "청바지-186이상-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-35-스키니핏", "청바지-186이상-50kg이하-35-슬림 스트레이트핏", "청바지-186이상-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-36이상-스키니핏", "청바지-186이상-50kg이하-36이상-슬림 스트레이트핏", "청바지-186이상-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-186이상-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-28이하-스키니핏", "청바지-186이상-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-29-스키니핏", "청바지-186이상-51kg~60kg-29-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-30-스키니핏", "청바지-186이상-51kg~60kg-30-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-31-스키니핏", "청바지-186이상-51kg~60kg-31-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-32-스키니핏", "청바지-186이상-51kg~60kg-32-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-33-스키니핏", "청바지-186이상-51kg~60kg-33-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-34-스키니핏", "청바지-186이상-51kg~60kg-34-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-35-스키니핏", "청바지-186이상-51kg~60kg-35-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-36이상-스키니핏", "청바지-186이상-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-186이상-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-28이하-스키니핏", "청바지-186이상-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-29-스키니핏", "청바지-186이상-61kg~70kg-29-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-30-스키니핏", "청바지-186이상-61kg~70kg-30-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-31-스키니핏", "청바지-186이상-61kg~70kg-31-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-32-스키니핏", "청바지-186이상-61kg~70kg-32-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-33-스키니핏", "청바지-186이상-61kg~70kg-33-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-34-스키니핏", "청바지-186이상-61kg~70kg-34-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-35-스키니핏", "청바지-186이상-61kg~70kg-35-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-36이상-스키니핏", "청바지-186이상-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-186이상-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-28이하-스키니핏", "청바지-186이상-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-29-스키니핏", "청바지-186이상-71kg~80kg-29-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-30-스키니핏", "청바지-186이상-71kg~80kg-30-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-31-스키니핏", "청바지-186이상-71kg~80kg-31-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-32-스키니핏", "청바지-186이상-71kg~80kg-32-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-33-스키니핏", "청바지-186이상-71kg~80kg-33-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-34-스키니핏", "청바지-186이상-71kg~80kg-34-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-35-스키니핏", "청바지-186이상-71kg~80kg-35-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-36이상-스키니핏", "청바지-186이상-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-186이상-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-28이하-스키니핏", "청바지-186이상-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-29-스키니핏", "청바지-186이상-81kg~90kg-29-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-30-스키니핏", "청바지-186이상-81kg~90kg-30-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-31-스키니핏", "청바지-186이상-81kg~90kg-31-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-32-스키니핏", "청바지-186이상-81kg~90kg-32-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-33-스키니핏", "청바지-186이상-81kg~90kg-33-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-34-스키니핏", "청바지-186이상-81kg~90kg-34-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-35-스키니핏", "청바지-186이상-81kg~90kg-35-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-36이상-스키니핏", "청바지-186이상-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-186이상-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-28이하-스키니핏", "청바지-186이상-91kg이상-28이하-슬림 스트레이트핏", "청바지-186이상-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-29-스키니핏", "청바지-186이상-91kg이상-29-슬림 스트레이트핏", "청바지-186이상-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-30-스키니핏", "청바지-186이상-91kg이상-30-슬림 스트레이트핏", "청바지-186이상-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-31-스키니핏", "청바지-186이상-91kg이상-31-슬림 스트레이트핏", "청바지-186이상-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-32-스키니핏", "청바지-186이상-91kg이상-32-슬림 스트레이트핏", "청바지-186이상-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-33-스키니핏", "청바지-186이상-91kg이상-33-슬림 스트레이트핏", "청바지-186이상-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-34-스키니핏", "청바지-186이상-91kg이상-34-슬림 스트레이트핏", "청바지-186이상-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-35-스키니핏", "청바지-186이상-91kg이상-35-슬림 스트레이트핏", "청바지-186이상-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-36이상-스키니핏", "청바지-186이상-91kg이상-36이상-슬림 스트레이트핏", "청바지-186이상-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 



















                          # 이전꺼
                #           elsif @response == "청바지-171~175"
                #       @response = {
                #         message: {
                #             text: "#{@user.name}님 몇키로임?"
                #         },
                #         keyboard: {
                #           type: "buttons",
                #           buttons: ["청바지,171~17,70kg", "청바지,171~17,80kg"]
                #         }
                #       }
                #           render json: @response, status: :ok
                # elsif @response == "청바지,166~170,70kg"
                #                     @response = {
                #                       message: {
                #                           text: "#{@user.name}님에게 어울리는 상품은  ㄱ(제현) 입니다."
                #                       },
                #                       keyboard: {
                #                         type: "buttons",
                #                         buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                #                       }
                #                     }
                #                   render json: @response, status: :ok
                #                   elsif @response == "청바지,166~170,80kg"
                #                     @response = {
                #                       message: {
                #                           text: "#{@user.name}님에게 어울리는 상품은  2(펌킨) 입니다."
                #                       },
                #                       keyboard: {
                #                         type: "buttons",
                #                         buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                #                       }
                #                     }
                #                     render json: @response, status: :ok
                #     elsif @response == "청바지,171~175"
                #       @response = {
                #         message: {
                #             text: "#{@user.name}님 몇키로임?"
                #         },
                #         keyboard: {
                #           type: "buttons",
                #           buttons: ["청바지,171~175,70kg", "청바지,171~175,80kg"]
                #         }
                #       }
                #           render json: @response, status: :ok
                #                 elsif @response == "청바지,171~175,70kg"
                #                     @response = {
                #                       message: {
                #                           text: "#{@user.name}님에게 어울리는 상품은  ㄷ(윤준) 입니다."
                #                       },
                #                       keyboard: {
                #                         type: "buttons",
                #                         buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                #                       }
                #                     }
                #                   render json: @response, status: :ok
                                  
                #                       elsif @response == "청바지,171~175,80kg"
                #                     @response = {
                #                       message: {
                #                           text: "#{@user.name}님에게 어울리는 상품은  4(동원) 입니다."
                #                       },
                #                       keyboard: {
                #                         type: "buttons",
                #                         buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                #                       }
                #                     }
                #                     render json: @response, status: :ok
            else
                @response = {
                  message: {
                      text: "#{@user.name}님이 잘못된 명령어를 입력하셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                  }
                }
                 render json: @response, status: :ok
             end
        end            
    end
end