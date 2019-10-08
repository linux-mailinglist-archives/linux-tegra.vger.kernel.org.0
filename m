Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 552A3D0458
	for <lists+linux-tegra@lfdr.de>; Wed,  9 Oct 2019 01:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbfJHXqN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Oct 2019 19:46:13 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45675 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbfJHXqN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Oct 2019 19:46:13 -0400
Received: by mail-io1-f68.google.com with SMTP id c25so801039iot.12
        for <linux-tegra@vger.kernel.org>; Tue, 08 Oct 2019 16:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=SPl3L4+4Zy9QlJN3K7IuqOc2JedlA0ldY7i+AP0Siqo=;
        b=I+N5hkvPCF8K1LY460NnH3Bs+ppv36e7pHAAko5cPGtVK7Q1xpMFtMk1sbwX3EL9Ae
         UX5ufwjfjE2WsQxxVvaJrkkGtrrD1A1swJroeZ6oWYFiFUD/gbGKkY6710T0F0X5S5Xo
         BF95rAFQKdDZy+9dBrgr05QKn2VguSytZtPaHPhpxauj1vAvK0o8UX1wBJzBZa1yl7EV
         jLHoqHF7Hse1l/Ohr1dGC6ATYWRzE6EftbRk42hoGB79bBRXmsmPeyS2gmRpO97jk05b
         X+CS58w6j5DGF3spjHV4AncNibrgaK8A9wTUdRqszmiSN3PwPwqQA/IsTfJ60gtOiuUB
         4Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=SPl3L4+4Zy9QlJN3K7IuqOc2JedlA0ldY7i+AP0Siqo=;
        b=N/0+CUv2C4JV+APazctJnIDJJoKSTv8ZYgshlsfYzZ+frAUh/DOAKrcP+Bwy9cxRgl
         8t2OcaWOelyV4HU1nQz5j49imfqFvU8JOiw6sJBpm1kdTOSXxHXm1QFXyiquMlIlnipz
         gjaDLjdkDfMMDctlF6OM53GpWEHYqJ2HLOkzSQIOzuSvqjzi48Vtza+lmsyob80xzYL0
         oAR7H2/dh6hzpqiXcRrdWzurc5HgeOPxmNzx3wrWaOkelgFMytqjkCDoaoGrAGchSJmf
         qMYrkfszm73wx2VDdvWqfJlZCB6HGYVJX49uj9K3ci+jsDh1FdXoAHOPcHaqXZAJlv0r
         0rQg==
X-Gm-Message-State: APjAAAVOer8Ko6pv0wbkKseZaTT/gwIpQ94Eoi9JYMyw92U9an7S+Qie
        zWNqPd+gou9Tlv1z2kbDR+PbXg==
X-Google-Smtp-Source: APXvYqz97nlCIt/+/P4PPfxa3nO+CVIeqE66+NVgtpZhnKj/IpAG2fhUxvCWOIqX/CoRt6DSjpBBFw==
X-Received: by 2002:a92:d084:: with SMTP id h4mr287013ilh.223.1570578372595;
        Tue, 08 Oct 2019 16:46:12 -0700 (PDT)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id m11sm250603ioq.5.2019.10.08.16.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 16:46:12 -0700 (PDT)
Date:   Tue, 8 Oct 2019 16:46:06 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Krzysztof Kozlowski <krzk@kernel.org>
cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
Message-ID: <alpine.DEB.2.21.9999.1910081643220.11044@viisi.sifive.com>
References: <20191002164047.14499-1-krzk@kernel.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 2 Oct 2019, Krzysztof Kozlowski wrote:

> Convert generic PWM bindings to DT schema format using json-schema.  The
> consumer bindings are split to separate file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 

[ ... ]

> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> index 36447e3c9378..3d1dd7b06efc 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> @@ -17,7 +17,7 @@ Required properties:
>    Please refer to sifive-blocks-ip-versioning.txt for details.
>  - reg: physical base address and length of the controller's registers
>  - clocks: Should contain a clock identifier for the PWM's parent clock.
> -- #pwm-cells: Should be 3. See pwm.txt in this directory
> +- #pwm-cells: Should be 3. See pwm.yaml in this directory
>    for a description of the cell format.
>  - interrupts: one interrupt per PWM channel

For the SiFive PWM driver documentation:

Acked-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul
