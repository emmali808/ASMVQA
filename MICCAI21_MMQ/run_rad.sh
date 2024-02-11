source activate mmq
#conda info -e
cd /home/coder/projects/MICCAI21_MMQ
modelpath="saved_model_rad"
ch="/"
modelpathout=$modelpath$ch$1
python3 main.py --use_VQA --VQA_dir $2 --maml --autoencoder --feat_dim 64 --img_size 84 --maml_model_path pretrained_maml_pytorch_other_optimization_3shot_newmethod.pth --maml_nums 2,4 --model $1 --lr $4 --seed 1342 --output $modelpathout --rnn $6 --record_id $7 --batch_size $5 --epochs $3
ch2="results-rad"
outpath=$ch2$ch$1
python3 test.py --use_VQA --VQA_dir $2 --maml --autoencoder --feat_dim 64 --img_size 84 --maml_model_path pretrained_maml_pytorch_other_optimization_3shot_newmethod.pth --input $modelpathout --epoch _last --maml_nums 2,4 --model $1 --record_id $7 --output=$outpath 