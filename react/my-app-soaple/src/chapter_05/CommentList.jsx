import Comment from "./Comment"

const comments = [
    {
        name: "손동우",
        comment: "안녕하세요, 손동우입니다."
    },
    {
        name: "유재석",
        comment: "리액트 재미있어요~!"
    },
    {
        name: "강민경",
        comment: "저도 리액트 배워보고 싶어요!!"
    },
]

const CommentList = (props) => {
    return (
        <div>
            {comments.map((comment, index) => {
                return (
                    <Comment key={index} name={comment.name} comment={comment.comment} />
                )
            })}
        </div>
    )
}

export default CommentList