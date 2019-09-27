# Welcome to Sonic Pi v3.1
#truffle butter

counter =1
use_bpm 105
live_loop:piano do
  with_fx :reverb do
    use_synth_defaults amp: 0.5
    play :d4
    sleep 0.75
    play :bb3
    sleep 0.75
    play :a3
    sleep 1
    play :g3
    sleep 0.5
    play :g4
    if counter<9
      play :g4
    else
      play :g5
    end
    sleep 0.25
    play :d4
    sleep 0.75
  end
  counter=counter+1
end

live_loop:bassline do
  use_synth :chipbass
  use_synth_defaults amp: 0.2
  play :d3
  sleep 0.75
  play :bb2
  sleep 0.75
  play :a2
  sleep 2.5
end

live_loop:boom do
  sample :bd_boom
  sleep 0.75
  sample :bd_boom
  sleep 0.75
  sample :bd_boom
  sleep 2.5
end

live_loop:cymbal do
  if counter<8
    15.times do
      sample :drum_cymbal_closed, sustain: 0.5
      sleep 0.5
    end
    sleep 0.5
  else sleep 0.5
  end
  
end

live_loop:clap do
  with_fx :reverb, room: 1 do
    sleep 1
    sample :perc_snap
    sleep 2
    sample :perc_snap
    sleep 1
  end
end

#elec_filt_snare
live_loop:brush do
  with_fx :reverb, room: 1 do
    if counter>8
      
      sample :drum_cymbal_pedal, finish: 1, amp: 2
      sleep 2
      sample  :drum_cymbal_pedal, finish: 1, amp: 2
      sleep 2
    else sleep 4
    end
    
  end
  if counter>31
    counter=1
  else
  end
  
end
