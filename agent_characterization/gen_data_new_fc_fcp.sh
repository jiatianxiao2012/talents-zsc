#!/bin/bash

YAML_CONFIG="/home/gpu01/tianxiaojia/Workplace2/talents-zsc/overcooked/src/burrito_rl/config/burrito_2p_gendata_fcp"

OPEN_POP_DIR="/home/gpu01/tianxiaojia/Workplace2/talents-zsc/overcooked/src/burrito_rl/policy_params/open_pp_fcp_15000000/selected_24"
FC_POP_DIR="/home/gpu01/tianxiaojia/Workplace2/talents-zsc/overcooked/src/burrito_rl/policy_params/fc_pp_fcp_15000000/selected_24"
HALLWAY_POP_DIR="/home/gpu01/tianxiaojia/Workplace2/talents-zsc/overcooked/src/burrito_rl/policy_params/hallway_pp_fcp_15000000/selected_24"
RING_POP_DIR="/home/gpu01/tianxiaojia/Workplace2/talents-zsc/overcooked/src/burrito_rl/policy_params/ring_pp_fcp_15000000/selected_24"

# OPEN_POLICIES=(
#   "8"
#   "33"
#   "7"
#   "25"
#   "14"
#   "21"
#   "29"
#   "42"
#   "47"
#   "16"
#   "10"
# )

# FC_POLICIES=(
#   "3"
#   "36"
#   "30"
#   "34"
#   "35"
#   "33"
#   "8"
#   "31"
#   "18"
#   "10"
# )

# HALLWAY_POLICIES=(
#    "8"
#    "25"
#     "13"
#    "11"
#    "15"
#    "26"
#   "23"
#   "29"
#   "21"
#   "34"
#   "10"
# )

# RING_POLICIES=(
#   "13"
#   "33"
#   "25"
#   "31"
#   "11"
#   "17"
#   "21"
#   "41"
#   "5"
#   "2"
#   "24"
# )
# LAYOUT="hallway"
# POP_DIR=$HALLWAY_POP_DIR
# YAML="${YAML_CONFIG}_${LAYOUT}.yaml"

# for POL in "${OPEN_POLICIES[@]}"; do
#   echo "Population Directory: $POP_DIR"
#   echo "Processing policy: $POL"
#   echo "Using Config: $YAML"

#   POL1_PATH="$POP_DIR/pol$POL/policy_state.pkl"
#   POLBR_PATH="$POP_DIR/polBR$POL/policy_state.pkl"

#   echo "POLICY 1: $POL1_PATH"
#   echo "BR POLICY: $POLBR_PATH"
#   AGENT_PARAM="agent-$POL"

#   # Use yq to update the pretrained model paths in-place
#   yq -i -y ".BASE_CONFIG.pretrained_model_path[0] = \"$POL1_PATH\"" "$YAML"
#   yq -i -y ".BASE_CONFIG.pretrained_model_path[1] = \"$POLBR_PATH\"" "$YAML"

#   echo "Running evaluation for $AGENT_PARAM"
#   python agent_characterization/gen_data.py \
#     --eval-episodes 18 \
#     --agent-0 "$AGENT_PARAM" \
#     --dataset-path "./data/burrito_${LAYOUT}_bp_6pol.pkl" \
#     --config "$YAML" \
#     --layout "$LAYOUT" \
#     --save-data

#   echo "Completing processing for $POL"
#   echo "----------------------------------------"
# done

# echo "All directories processed"


##################### Number of policies for each layout #######################

# mep/fcp final checkpoints: 1-8 larger mid-checkpoints: 11-18 smaller mid-checkpoints: 21-28
# mep/fcp eval/final checkpoints: 101-104 eval larger mid-checkpoints: 111-114 eval smaller mid-checkpoints: 121-124
# bp part1 0000:8 0001-0007 1-7 part2 0000: 18 0001-0007 11-17 part3 0000: 28 0001-0007 21-27 (final checkpoints is checkpoint_000180)
# bp polBRX vs polX: 1-8, 11-18, 21-28
# bp/eval polX: 1-8 part4 final checkpoints(000180) 0000: 8 0001-0007 1-7, 11-18 mid-checkpoints(000120) 0000: 18 0001-0007 11-17

####################### TJ bp part #################################
#!/bin/bash

# OPEN_POLICIES=(
#   "23" "2" "14" "28" "7" "17" "1" "24"
#   "12" "26" "5" "21" "8" "16" "3" "27"
#   "11" "25" "4" "22" "6" "18" "13" "15"
# )

# HALLWAY_POLICIES=(
#   "23" "2" "14" "28" "7" "17" "1" "24"
#   "12" "26" "5" "21" "8" "16" "3" "27"
#   "11" "25" "4" "22" "6" "18" "13" "15"
# )

# FC_POLICIES=(
#   "23" "2" "14" "28" "7" "17" "1" "24"
#   "12" "26" "5" "21" "8" "16" "3" "27"
#   "11" "25" "4" "22" "6" "18" "13" "15"
# )

# RING_POLICIES=(
#   "23" "2" "14" "28" "7" "17" "1" "24"
#   "12" "26" "5" "21" "8" "16" "3" "27"
#   "11" "25" "4" "22" "6" "18" "13" "15"
# )

# LAYOUT="fc"
# POP_DIR="$FC_POP_DIR"
# YAML="${YAML_CONFIG}_${LAYOUT}.yaml"

# for POL in "${FC_POLICIES[@]}"; do
#   echo "Population Directory: $POP_DIR"
#   echo "Processing pair: pol$POL vs polBR$POL"
#   echo "Using Config: $YAML"

#   POL1_PATH="$POP_DIR/polX/pol$POL/policy_state.pkl"
#   POLBR_PATH="$POP_DIR/polBRX/pol$POL/policy_state.pkl"

#   AGENT_0_PARAM="pol$POL"
#   AGENT_1_PARAM="polBR$POL"

#   yq e ".BASE_CONFIG.pretrained_model_path[0] = \"$POL1_PATH\"" -i "$YAML"
#   yq e ".BASE_CONFIG.pretrained_model_path[1] = \"$POLBR_PATH\"" -i "$YAML"

#   echo "Running evaluation for $AGENT_0_PARAM vs $AGENT_1_PARAM"
#   python agent_characterization/gen_data.py \
#     --eval-episodes 12 \
#     --agent-0 "$AGENT_0_PARAM" \
#     --agent-1 "$AGENT_1_PARAM" \
#     --dataset-path "./data/burrito_${LAYOUT}_bp_3parts_pol24.pkl" \
#     --config "$YAML" \
#     --layout "$LAYOUT" \
#     --save-data

#   echo "Completing processing for pair pol$POL vs polBR$POL"
#   echo "----------------------------------------"
# done



##########################################################################

######################## TJ mep/fcp part #################################

OPEN_POLICIES_A=(
  "23"
  "12"
  "22"
  "16"
  "14"
  "4"
  "15"
  "8"
  "21"
  "18"
  "26"
  "6"
)

OPEN_POLICIES_B=(
  "2"
  "28"
  "5"
  "25"
  "1"
  "13"
  "7"
  "24"
  "17"
  "27"
  "3"
  "11"
)

FC_POLICIES_A=(
  "27"
  "2"
  "17"
  "12"
  "25"
  "5"
  "14"
  "15"
  "22"
  "4"
  "24"
  "7"
)

FC_POLICIES_B=(
  "3"
  "11"
  "8"
  "23"
  "16"
  "13"
  "1"
  "21"
  "18"
  "28"
  "6"
  "26"
)

HALLWAY_POLICIES_A=(
  "14"
  "7"
  "22"
  "8"
  "25"
  "6"
  "26"
  "18"
  "28"
  "5"
  "17"
  "1"
)

HALLWAY_POLICIES_B=(
  "3"
  "23"
  "16"
  "24"
  "13"
  "21"
  "15"
  "27"
  "2"
  "11"
  "4"
  "12"
)

RING_POLICIES_A=(
  "25"
  "16"
  "26"
  "6"
  "23"
  "8"
  "24"
  "4"
  "12"
  "2"
  "11"
  "7"
)

RING_POLICIES_B=(
  "14"
  "28"
  "13"
  "27"
  "1"
  "21"
  "17"
  "22"
  "3"
  "15"
  "5"
  "18"
)

LAYOUT="fc"
POP_DIR=$FC_POP_DIR
YAML="${YAML_CONFIG}_${LAYOUT}.yaml"

for i in "${!FC_POLICIES_A[@]}"; do
  POL_A="${FC_POLICIES_A[$i]}"
  POL_B="${FC_POLICIES_B[$i]}"

  echo "Population Directory: $POP_DIR"
  echo "Processing pair: $POL_A vs $POL_B"
  echo "Using Config: $YAML"

  POL1_PATH="$POP_DIR/pol$POL_A/policy_state.pkl"
  POL2_PATH="$POP_DIR/pol$POL_B/policy_state.pkl"

  # AGENT_PARAM="agent-${POL_A}_vs_${POL_B}"
  AGENT_0_PARAM="pol${POL_A}"
  AGENT_1_PARAM="pol${POL_B}"

  # yq -i -y ".BASE_CONFIG.pretrained_model_path[0] = \"$POL1_PATH\"" "$YAML"
  # yq -i -y ".BASE_CONFIG.pretrained_model_path[1] = \"$POL2_PATH\"" "$YAML"

  yq e ".BASE_CONFIG.pretrained_model_path[0] = \"$POL1_PATH\"" -i "$YAML"
  yq e ".BASE_CONFIG.pretrained_model_path[1] = \"$POL2_PATH\"" -i "$YAML"
  # echo "Running evaluation for $AGENT_PARAM"
  # python agent_characterization/gen_data.py \
  #   --eval-episodes 10 \
  #   --agent-0 "$AGENT_PARAM" \
  #   --dataset-path "./data/burrito_${LAYOUT}_bp_24pol_polBR.pkl" \
  #   --config "$YAML" \
  #   --layout "$LAYOUT" \
  #   --save-data
  echo "Running evaluation for $AGENT_0_PARAM vs $AGENT_1_PARAM"
  python agent_characterization/gen_data.py \
    --eval-episodes 22 \
    --agent-0 "$AGENT_0_PARAM" \
    --agent-1 "$AGENT_1_PARAM" \
    --dataset-path "./data/burrito_${LAYOUT}_fcp_24pol.pkl" \
    --config "$YAML" \
    --layout "$LAYOUT" \
    --save-data

  echo "Completing processing for pair $POL_A vs $POL_B"
  echo "----------------------------------------"
done

echo "All directories processed"

##############################################################################
