Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513331ACFF4
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 20:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgDPSwb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 14:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbgDPSwb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 14:52:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25F0C061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 11:52:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m2so6402634lfo.6
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=py7oEgmRCooYj2CPRnKMi71cKEMq2nTHeaImBJf9BbU=;
        b=LfN9BJrMTXYSHJ48+TPTF6hqH79k99zTWSxz5JYksutzuqfV1AyeGkj3fhJEyGPdJR
         vqYxFUvHhk1D+dLL+M9NDKjWrBwhl155TAs09Dq9UfqqjzgdP8IUL5mu2ojmcdKfNQ9S
         B71TdsaBTF3ITggGDIbL16Bl+m296H068j8rK5lyzgwGhciXYEyhL0VGJ6I8suD2o8KE
         n9386adRUObZDWjrsdt5uuATd6JWfo4E/SWvzaQ9d08lHa70BFaCCIUAFbkVAlCUV82M
         0A3rkQD2qvhO1f9SRl3HCTmxd1n1JWZsPOjKga038TJXS04isBlwBa4fKeG6W5Vkfysc
         TwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=py7oEgmRCooYj2CPRnKMi71cKEMq2nTHeaImBJf9BbU=;
        b=R8mp+YiMS8oEjnjofSt5FONRWCN7QM4/W/dulffrhirpi9P9kXwvMpFnmjaoeSTu26
         Gl9t/l9HcGWaEqe1cLCJ9ARrANB2ALQLVX3iOJp7JPRk2+usyyNrRImuIgDrTMp732ok
         xi+9Fpe1gjCFmGDZyPv4ngCz6lme6qceUukZl3qr0Nvo0ouox1rkDHvFq+VVh7yKWmXe
         o5rm/sHQsl98vjX6uUO5PU9W2N9mg9OaOGS7k1B6ndCNk4Fim9airSYdlr717z/qMPoC
         FJ6QN0ls2enHpEeyo0gMyFPL2NNa/OKAfmZtg9UO7aIZ1ArN5KuwD0CnFdMBzMx5cPD5
         zIIg==
X-Gm-Message-State: AGi0Pubs/kOXwULxxjGGm4OIQ7+6cP8ZpryqavgPP1qmJIH7AwTN+hqT
        LRVCPJUUky8AxkDbVaaI/qpZNd78
X-Google-Smtp-Source: APiQypJRhEE+vxpkY0spXrvTzGYMIa/BcafeIvcF8eO3lirtSeQl6gSTQYW/8N1v3nvnWCNscNfg5g==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr7087040lfc.29.1587063148827;
        Thu, 16 Apr 2020 11:52:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id l18sm363987ljg.98.2020.04.16.11.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 11:52:27 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
Date:   Thu, 16 Apr 2020 21:52:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416174112.GS4796@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.04.2020 20:41, Laurent Pinchart пишет:
...
>> +	if (output->bridge) {
>> +		err = drm_bridge_attach(&output->encoder, output->bridge,
>> +					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> 
> Using DRM_BRIDGE_ATTACH_NO_CONNECTOR is definitely the way to go, but
> please be aware that it will require creating a connector and an encoder
> manually (which I think this driver already does), and using the bridge
> operations to implement the connector operations. I highly recommend
> using the DRM bridge connector helper for this purpose.

Okay, I missed that there is a DRM bridge connector helper. Thank you
very much for the suggestion, I'll switch to the bridge helper in v4.

>> +		if (err) {
>> +			dev_err(output->dev, "cannot connect bridge: %d\n",
>> +				err);
>> +			return err;
>> +		}
>> +	}
>> +
>>  	if (output->panel) {
> 
> May I also recommend switching to the DRM panel bridge helper ? It will
> simplify the code.

Could you please clarify what is the "DRM panel bridge helper"?

I think we won't need any additional helpers after switching to the
bridge connector helper, no?

...
>> +		np = of_graph_get_remote_node(rgb->output.bridge->of_node,
>> +					      panel_port, -1);
> 
> This shouldn't be needed, the LVDS codec bridge driver should already
> get the panel and handle it internally. You only need to handle panels
> in this driver when they're connected directly to the RGB input.

Indeed, it won't be needed if we will use the bridge connector helper.
Thank you very much for the clarifications!
