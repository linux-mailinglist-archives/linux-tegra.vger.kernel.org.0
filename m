Return-Path: <linux-tegra+bounces-4604-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FB7A14164
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jan 2025 19:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 043D2165A29
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jan 2025 18:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C42D22D4DC;
	Thu, 16 Jan 2025 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="f3wTgzYR"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB27154C08
	for <linux-tegra@vger.kernel.org>; Thu, 16 Jan 2025 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737050663; cv=none; b=AyHJHHYkQIzzAKdSBI4erVz2O8Mr6hDslIuq1gQYTM1Ax8cJn1swcRzmM+aMGYf3IhY0aFDXx2rLXsMzD6AVp0y7liyWTPgeFBXxJJpdhca7rTZZXC1VfmzdP9XQ10z1BGX33OfIt2F1VXtGNuLd/LvSOiMhp7cuEmetDso0NqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737050663; c=relaxed/simple;
	bh=f7JIBXc2nPHxlJl7igMbfuXIJ4HLspMfAWuq0iysxYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gy1Kh1BtplSFOjq7z630FzihAhQ8Zqdp6tM7XnMwMq4zURw8LA2CDvMTBj+gUXAfxVQaZFbhX8JQeu1fkneMM9xakB0Yh+0hsTOyHGjXCc3k7FsoPMsfeEnNkItkqT4lMdrB1H1LkLHeBI9HKskvsirudUsaZXbVen7VWygpCGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=f3wTgzYR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2164b662090so23246995ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jan 2025 10:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737050661; x=1737655461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wd1oeWyHI9gXwuqG0xZ0ivGODmZaK+fUcpqdzaY6Nw=;
        b=f3wTgzYRs9gEs97gVmBR/Ug7JodLB3FrL3OL7KJJh0mS3qNz+G0BKyApzQd+mIm2Lx
         TSExq7YjX9X9xd0D32+6xRCBf2cuhCR6yHyQIZjixaFKnjhtjOrW105vx/viQ2ZFii89
         oYJnrQaZMog2gBxOcBvmhuVJ8QKBfUxt0yQB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737050661; x=1737655461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Wd1oeWyHI9gXwuqG0xZ0ivGODmZaK+fUcpqdzaY6Nw=;
        b=DrUOicudJSlxwhmD7DoQSl3jIRtVh15DNsO7MZMCkWdU3QDkUYHtoBqNIR3EArAmkB
         iU0PN7+9RvOndIthZlFk1NQF5QGOqGGphkv51BQ3u+hZb4/esxduMl1wtbTwwupBZxEx
         QMVNeiV/tayv2jer7OeNygjE73W00LPTt3BM7kXtqC0adg/iKLVxTHoMW5k32YXzjr6Z
         hAiXiBB0ZKj82XUWmaF+foNVeSvtf3tO8EQw8IgEOOiGUlq7BFzRmgkVbIdHYN/wCI1r
         ihD6z54rqJtijJDzFidGlEPbaUr0wGMyxemr6QVCP2BwREI+uLI9OO0htuzMuVjTPBKK
         E9KA==
X-Forwarded-Encrypted: i=1; AJvYcCW8XO8FKsybFgXHIyoPqisjhxKlwBmDZ75bgFAwpAU3M20sJkaygereNLfbp3lQPfFyF4UnjB1COC1WSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCXuEHTH0hydizwspVc3e/ujhxM7qlKHWqA6awjVuUMGEBG358
	onR5ubYnO1tb8KDHdD4lnbZNuh20Asd+kn8EcGagymcMEkuqgRO9hOatCr8VNQ==
X-Gm-Gg: ASbGncvTO9kIssWtHeNP3pz7btnA5e//8hvjjwQgU4gfBYqxU4yMyML2Eu6WPbFh511
	Y//J80mkzgTFS8FrB+jP4x9sCnWWo5vkRS9N3ZyCBXVcEVA5Sa38TBQ3KJGq6Q+B8cFo8+8wWcJ
	Df/Okanu11/HIVasSRe0HpsKcvRZooPhGgm42DNfg8CK3A4FqR96qEJ3PSP03QGc2+JmLAfqR5k
	JQTQ/f9UOsIaKCqlQumtfbaBhNHmYRQlTJNtUK7JhwMOhto64v3KFcvXPCnGMFUhudw9nQ6BZas
	yahguQ+uCqN9D5xbKbVy
X-Google-Smtp-Source: AGHT+IHdMjYWYUPWi30MlBFs8sU8F6TlSjCCIdRcJHouC8fvOgy8yNmIwKVXpO733Awqz9ZjlbG2TQ==
X-Received: by 2002:a17:903:1245:b0:21a:82b7:fea2 with SMTP id d9443c01a7336-21a83f592edmr479108815ad.15.1737050659554;
        Thu, 16 Jan 2025 10:04:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9b3asm3086255ad.75.2025.01.16.10.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 10:04:18 -0800 (PST)
Message-ID: <967278a1-a2e9-44c3-90ee-ae9a57a54421@broadcom.com>
Date: Thu, 16 Jan 2025 10:04:14 -0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
To: Celeste Liu <uwu@coelacanthus.name>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Russell King <linux@armlinux.org.uk>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 Thierry Reding <treding@nvidia.com>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/25 12:41, Celeste Liu wrote:
> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
> 
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[2]
> 
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> can only be enabled when all RT processes are in the root cgroup. But it will
> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
> 
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> support it.
> 
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
> 
> Tested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>   arch/arm/configs/bcm2835_defconfig   | 1 -

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> # 
bcm2835_defconfig
-- 
Florian

