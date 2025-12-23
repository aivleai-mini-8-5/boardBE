package com.a1174.backend;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@CrossOrigin(origins = "*") //  실무에선 프론트 도메인만 허용해야 하지만, 실습 편의상 전체 허용
public class GuestController {

    private final GuestRepository guestRepository;

    // 1. 서버 상태 확인용 (Health Check)
    @GetMapping("/health")
    public String health() {
        return "Backend Status:Version2 Application is UP! Current Time: " + LocalDateTime.now();
    }

    // 2. 방명록 조회 (Read)
    @GetMapping("/guests")
    public List<Guest> getGuests() {
        return guestRepository.findAll();
    }

    // 3. 방명록 작성 (Write)
    @PostMapping("/guests")
    public Guest createGuest(@RequestBody Guest guest) {
        guest.setCreatedAt(LocalDateTime.now());
        return guestRepository.save(guest);
    }
}