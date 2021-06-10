//
//  PregFitModelData.swift
//  PregFit
//
//  Created by Darindra R on 08/06/21.
//

import UIKit

struct PregFitData {
    static var programs: [Program] {
        get {
            return [
                Program(name: "Dumbbell Workout Plan", duration: 8, kcal: 55, exercises: [
                    Exercise(exerciseName: "Dumbbell Goblet Squat",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Stand with your feet hip-width apart and hold a dumbbell in front of your chest, elbows pointing toward the floor.", "Push your hips back and bend your knees to lower into a squat. Lower the dumbbell to the floor at the same time. Push yourself back to start."],
                             videoURL: "https://youtu.be/mF5tnEBrdkc"),
                    Exercise(exerciseName: "Dumbbell Bent Over Row",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Assume a standing position while holding a dumbbell in each hand with a neutral grip. Hinge forward until your torso is roughly parallel with the floor (or slightly above) and then begin the movement by driving the elbows behind the body while retracting the shoulder blades.", "Pull the dumbbells towards your body until the elbows are at (or just past) the midline and then slowly lower the dumbbells back to the starting position under control. Repeat for the desired number of repetitions."],
                             videoURL: "https://youtu.be/IAsMMl0shh4"),
                    Exercise(exerciseName: "Dumbbell Squat and Press",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Stand with feet hip-width apart,holding a dumbbell in each hand at shoulder height.", "Keeping your chest up and core engaged, lower into a squat position, keeping your booty back and thighs as close to parallel to the ground as possible.", "Driving though your heels, come back up to standing as you press the dumbbells overhead."],
                             videoURL: "https://youtu.be/7JtzNydMIJ8"),
                    Exercise(exerciseName: "Dumbbell Reverse Lunge",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Grab a set of dumbbells. Stand tall with your feet shoulder-width apart. Your arms should be hanging straight down by your sides.", "Push your chest out and take a large step backward, lowering your rear knee toward the ground while keeping your front shin as vertical as possible. Push yourself back to the starting position, and repeat for the desired reps before switching legs."],
                             videoURL: "https://www.youtube.com/watch?v=a1ip81otol4"),
                    Exercise(exerciseName: "Dumbbell Press",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Hold the dumbbells by your shoulders with your palms facing forwards and your elbows out to the sides and bent at a 90° angle.", "Without leaning back, extend through your elbows to press the weights above your head. Then slowly return to the starting position", "Then slowly return to the starting position"
                             ],
                             videoURL: "https://youtu.be/hbE9iMNjLDQ"),
                    Exercise(exerciseName: "Single Arm Row",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Begin with your left foot in front of the right, left knee slightly bent and left hand resting on your left thigh.", "Hold a dumbbell in your right hand, arm extended toward the ground.", "Row the dumbbell up to chest height, keeping your elbow tucked closely to your side, then return to start position."],
                             videoURL: "https://youtu.be/J1FuujHrNAU"),
                    Exercise(exerciseName: "Dumbbell Front Raise",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Begin standing tall, holding a dumbbell in each hand and palms resting against the front of your thighs.", "Raise your right arm straight in front of you to shoulder height, then return to start position. Repeat on the left side."],
                             videoURL: "https://youtu.be/sOcYlBI85hc"),
                    Exercise(exerciseName: "Dumbbell Curls",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Stand holding a dumbbell in each hand with your arms hanging by your sides. Ensure your elbows are close to your torso and your palms facing forward.", "Keeping your upper arms stationary, exhale as you curl the weights up to shoulder level while contracting your biceps."],
                             videoURL: "https://youtu.be/Nkl8WnH6tDU"),
                    Exercise(exerciseName: "Dumbbell Kickbacks",
                             requirements: ["Yoga Map", "Dumbbell 1 Kg"],
                             steps: ["Hold a dumbbell in each hand with your palms facing in toward each other, keeping your knees bent slightly. Engage your core and maintain a straight spine as you hinge forward at the waist, bringing your torso almost parallel to the floor.", "Keep your upper arms in close to your body and your head in line with your spine, tucking your chin in slightly. On an exhale, engage your triceps by straightening your elbows.", "Hold your upper arms still, only moving your forearms during this movement. Pause here, then inhale to return the weights to the starting position."],
                             videoURL: "https://youtu.be/ShCYaoHmWmk"),
                ], image: UIImage(named: "Dumbbell")),
                Program(name: "Relaxing Yoga Poses", duration: 12, kcal: 45, exercises: [
                    Exercise(exerciseName: "Easy Pose",
                             requirements: ["Yoga Map"],
                             steps: ["Begin seated and cross your legs in the way that is most comfortable for you with either the right or left leg in front.", "Sit up straight and feel length in your side body (waist)", "Lengthen your neck and allow your shoulders to move easily down and away from your ears by relaxing the trapezius muscles."],
                             videoURL: "https://youtu.be/ykiASus9kmg"),
                    Exercise(exerciseName: "Down Dog Pose",
                             requirements: ["Yoga Map"],
                             steps: ["Begin on all fours with hands shoulder width apart and knees hip-width apart.", "On your exhalation, lift your hips to the sky with straight arms and straight legs. Be aware that the elbows and knees are soft, not locked.", "If you are in your second or third trimester, it can often feel much more comfortable to have the stance wider. Just make sure that when you look back at your feet you are looking at your toes."],
                             videoURL: "https://youtu.be/ayRU3ecmPbI"),
                    Exercise(exerciseName: "Cat Cow Pose",
                             requirements: ["Yoga Map"],
                             steps: ["Begin on all fours with hands shoulder width apart and knees hip-width apart.", "Inhale and gaze to the sky, lifting the breastbone and the coccyx (tailbone) toward the sky as you softly contract in your lower back", "Exhale and round the spine in the shape of a rainbow. Take it easy with the pelvic tuck in the second and third trimesters, and focus more on the curve in the upper body."],
                             videoURL: "https://youtu.be/kqnua4rHVVA"),
                    Exercise(exerciseName: "Goddess Pose",
                             requirements: ["Yoga Map"],
                             steps: ["Begin standing with your feet a little bit wider than your shoulders.", "Let your hips rotate outward so that your feet are turned out to a 45° angle and your knees face the second toe of each foot.", "Keep your spine erect and gaze forward as you inhale and bend your knees toward a 90° angle, keeping your knees turned out.", "Exhale as you press to standing, emphasising the strength in the inner thigh as it helps you drive back up to standing. Your abs will be lightly engaged in the movement to provide you with additional core stabilisation."],
                             videoURL: "https://youtu.be/YxMToLwoLwY"),
                    Exercise(exerciseName: "Eztended Puppy Pose",
                             requirements: ["Yoga Map"],
                             steps: ["Come onto all fours. See that your shoulders are above your wrists and your hips are above your knees. Walk your hands forward a few inches and curl your toes under.", "As you exhale, move your buttocks halfway back toward your heels. Keep your arms active; don't let your elbows touch the ground.", "Drop your forehead to the floor or to a blanket and let your neck relax. Keep a slight curve in your lower back. To feel a nice long stretch in your spine, press the hands down and stretch through the arms while pulling your hips back toward your heels.", "Breathe into your back, feeling the spine lengthen in both directions. Hold for 30 seconds to a minute, then release your buttocks down onto your heels."
                             ],
                             videoURL: "https://youtu.be/1ubhPtojR4w"),
                    Exercise(exerciseName: "Child's Pose",
                             requirements: ["Yoga Map", "Boolster"],
                             steps: ["Kneel with the tops of your feet pressed into the floor. Place both palms flat on the floor.", "Hold a dumbbell in your right hand, arm extended toward the ground.", "Keeping your hips over your knees, tuck your chin to your chest and extend your arms until your upper body is parallel to the ground. Draw your shoulders away from your ears and arch your lower back to a comfortable position, holding for the given time. If you feel your abs working, bring your hips back to release pressure."],
                             videoURL: "https://youtu.be/uxY2UofbghA"),
                    Exercise(exerciseName: "Leg Up The Wall Pose",
                             requirements: ["Yoga Map", "Boolster or pillow"],
                             steps: ["Sit with your right side against the wall, with bent knees and your feet drawn in toward your hips. Swing your legs up against the wall as you turn to lie flat on your back. Place your hips against the wall or slightly away. Place your arms in any comfortable position. Stay in this position for up to 20 minutes.", "To release the pose, gently push yourself away from the wall. Relax on your back for a few moments. Draw your knees into your chest and roll onto your right side."],
                             videoURL: "https://youtu.be/h2UrHSo9Pdk"),
                    Exercise(exerciseName: "Wide Seated Forward Fold",
                             requirements: ["Yoga Map"],
                             steps: ["Sit on the ground and separate your legs as wide as you can. Bend your knees slightly (so they're not locked), flex your feet, and start to fold forward. If you can, rest your forearms on the ground."],
                             videoURL: "https://youtu.be/E6EHgtTupRo"),
                    Exercise(exerciseName: "Seated Side Bend",
                             requirements: ["Yoga Map"],
                             steps: ["Start seated with legs crossed. Sit tall with a straight spine, lift your left arm up, bring your right hand off to the right, then side bend to the right. Take a few breaths before repeating on the left."],
                             videoURL: "https://youtu.be/vaVaIitmAoE"),
                    Exercise(exerciseName: "Seated Side Bend",
                             requirements: ["Yoga Map"],
                             steps: ["Come to a seated position. Sit tall and position your legs so that your left leg is on the bottom and your right leg is on top. Ensure that your right ankle is over your left knee and that your shins are parallel with one another.", "Flex both feet and fold forward with every exhale. Do you best to keep your spine as straight as possible."],
                             videoURL: "https://www.youtube.com/watch?v=LMtb5vT4--Y"),
                    Exercise(exerciseName: "Bound Angle Pose",
                             requirements: ["Yoga Map", "Pillow"],
                             steps: ["Sit on the ground come into Buddha konasana (butterfly pose) by bringing the bottoms of your feet together in front of you. Wrap your hands around your feet and sit tall for a few breaths.", "Once you settle into the pose, start to hinge forward at your hips to deepen the stretch."],
                             videoURL: "https://youtu.be/xPeL1FbJUpc"),
                ], image: UIImage(named: "Yoga")),
            ]
        }
    }

    static var exercises: [Exercise] {
        get {
            var listExercises = [Exercise]()
            for program in programs {
                listExercises.append(contentsOf: program.exercises)
            }

            return listExercises.sorted { $0.exerciseName < $1.exerciseName }
        }
    }
}
