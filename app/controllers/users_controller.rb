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
                render json: @response, status: :ok
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
                render json: @response, status: :ok
            end
        else
#나에게 가장 잘 맞는 청바지 추천
            if @response == "나에게 가장 잘맞는 청바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 청바지추천을 누르셨습니다. 추천서비스를 위해 간단한 설문을 진행하겠습니다 "
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["설문시작"]
                  }
                }
                render json: @response, status: :ok
            elsif @response == "설문시작"
                @response = {
                  message: {
                      text: "#{@user.name}님의 키는 어느 정도인가요?."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["165이하", "166~170", "171~175", "176~180", "180~185","185이상"]
                  }
                }
                render json: @response, status: :ok
#키 설정 165 이하부터
        elsif @response == "165이하"
                @response = {
                  message: {
                      text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["50이하", "51~60", "61~70", "71~80", "81~90","91이상"]
                  }
                }
                render json: @response, status: :ok
   
            elsif @response == "50이하" 
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                         render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-28) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-28) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-28) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-28) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                        render json: @response, status: :ok 
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-29) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-29) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-29) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-29) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok 
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-30) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-30) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-30) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-30) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-31) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-31) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-31) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-31) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-32) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-32) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-32) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-32) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-33) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-33) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-33) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-33) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                            elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-34) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-34) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-34) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-34) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                    
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-35) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-35) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-35) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-35) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-36) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-36) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-36) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-36) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                        
                
            elsif @response == "51~60"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-28) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-28) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-28) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-28) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok 
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-29) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-29) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-29) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-29) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok 
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-30) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-30) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-30) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-30) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-31) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-31) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-31) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-31) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-32) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-32) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-32) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-32) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-33) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-33) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-33) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-33) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                            elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-34) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-34) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-34) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-34) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                    
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-35) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-35) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-35) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-35) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                        
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-51~60-36) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-51~60-36) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-51~60-36) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-51~60-36) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok                 
            elsif @response == "61~70"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        
            elsif @response == "71~80"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        
            elsif @response == "81~90"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
              
            elsif @response == "91이상"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
#키 설정 166~170부터
        elsif @response == "166~170"
                @response = {
                  message: {
                      text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["50이하", "51~60", "61~70", "71~80", "81~90","91이상"]
                  }
                }
                render json: @response, status: :ok
   
            elsif @response == "50이하"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        elsif @response == "슬림 스트레이트"
                          @response = {
                            message: {
                                text: "#{@user.name}님에게 어울리는 상품은  ㄱ(165이하-50이하-28kg이하) 입니다."
                            },
                            keyboard: {
                              type: "buttons",
                              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                            }
                          }
                          render json: @response, status: :ok
                        elsif @response == "스키니"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄴ(165이하-50이하-28kg이하) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok    
                        elsif @response == "스트레이트"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은  ㄷ(165이하-50이하-28kg이하) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok
                        elsif @response == "레귤러"
                            @response = {
                              message: {
                                  text: "#{@user.name}님에게 어울리는 상품은 ㄹ(165이하-50이하-28kg이하) 입니다."
                              },
                              keyboard: {
                                type: "buttons",
                                buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                              }
                            }
                            render json: @response, status: :ok 
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        
                
            elsif @response == "51~60"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        
            elsif @response == "61~70"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        
            elsif @response == "71~80"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                        
            elsif @response == "81~90"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
              
            elsif @response == "91이상"
                @response = {
                  message: {
                      text: "#{@user.name}님의 평소입으시는 바지사이즈를 선택해주세요"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["28이하", "29", "30", "31", "32","33","34","35","36이상"]
                  }
                }
                render json: @response, status: :ok
                   elsif @response == "28이하"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "29"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "30"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "31"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                
                    elsif @response == "32"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "33"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok 
                    elsif @response == "34"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "35"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok
                    elsif @response == "36이상"
                        @response = {
                          message: {
                              text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                          },
                          keyboard: {
                            type: "buttons",
                            buttons: ["스키니", "슬림 스트레이트", "스트레이트", "레귤러"]
                          }
                        }
                        render json: @response, status: :ok                        
                        
                        
                        
#나에게 가장 잘 맞는 정장바지 추천            
            elsif @response == "나에게 가장 잘맞는 정장바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 정장바지추천을 누르셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                  }
                }
                render json: @response, status: :ok
  #나에게 가장 잘 맞는 반바지 추천              
            elsif @response == "나에게 가장 잘맞는 반바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 반바지추천을 누르셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                  }
                }
                render json: @response, status: :ok
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
